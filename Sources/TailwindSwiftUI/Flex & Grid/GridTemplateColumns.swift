//
//  GridLayout.swift
//
//
//  Created by Jiafu Zhang on 3/20/24.
//

import SwiftUI

public struct GridLayout: Layout {
    public struct Cache {
        var heights: [CGFloat]
        var proposal: ProposedViewSize = .unspecified
    }
    
    private let cols: Int
    private let gap: Gap
    
    private var columnSpacing: CGFloat {
        .scale(gap.column) ?? 0
    }
    
    private var rowSpacing: CGFloat {
        .scale(gap.row) ?? 0
    }
    
    public func makeCache(subviews: Subviews) -> Cache {
        .init(heights: heights(subviews: subviews, proposal: .unspecified))
    }
    
    public func updateCache(_ cache: inout Cache, subviews: Subviews) {
        cache.heights = heights(subviews: subviews, proposal: cache.proposal)
    }
    
    private func heights(subviews: Subviews, proposal: ProposedViewSize) -> [CGFloat] {
        var from = 1
        var row = 1
        var rowHeight: CGFloat = 0
        var heights = [CGFloat]()
        var proposal = proposal
        if let width = proposal.width {
            let spanWidth = (width - columnSpacing * CGFloat(cols - 1)) / CGFloat(cols)
            proposal = .init(width: spanWidth, height: nil)
        }
        subviews.indices.forEach { index in
            let subview = subviews[index]
            let end = startEnd(subview: subview, from: from).1
            from = end + 1
            let colHeight = subview.sizeThatFits(.init(width: proposal.width, height: nil)).height
            rowHeight = max(rowHeight, colHeight)
            if index != subviews.endIndex - 1 {
                let nextSubview = subviews[index + 1]
                let (nextStart, nextEnd) = startEnd(subview: nextSubview, from: from)
                if nextStart < end || nextEnd > cols {
                    row += 1
                    from = 1
                    heights.append(rowHeight)
                    rowHeight = 0
                }
            } else {
                from = 1
                heights.append(rowHeight)
            }
        }
        return heights
    }
    
    public func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout Cache) -> CGSize {
        let proposedSize = proposal.replacingUnspecifiedDimensions()
        if proposedSize.width > 0 && proposedSize.width < .infinity && cache.proposal != proposal {
            cache.proposal = proposal
            cache.heights = heights(subviews: subviews, proposal: proposal)
        }
        let width = proposal.width ?? 0
        let heights = cache.heights.filter { $0 > 0 }
        let height = heights.reduce(.zero) { $0 + $1} + rowSpacing * CGFloat(heights.count - 1)
        return .init(width: width, height: height)
    }
    
    public func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout Cache) {
        let spanWidth = (bounds.width - CGFloat(cols - 1) * columnSpacing) / CGFloat(cols)
        print("column spacing: \(columnSpacing), span width: \(spanWidth)")
        var row = 0
        var spanHeight = cache.heights[row]
        var centerX: CGFloat = bounds.minX
        var centerY: CGFloat = spanHeight / 2 + bounds.minY
        var from = 1
        subviews.indices.forEach { index in
            let subview = subviews[index]
            let (start, end) = startEnd(subview: subview, from: from)
            from = end + 1
            centerX = CGFloat(start - 1) * (spanWidth + columnSpacing)
            let span = end - start + 1
            let width = spanWidth * CGFloat(span) + CGFloat(span - 1) * columnSpacing
            centerX += width / 2 + bounds.minX
            subview.place(at: .init(x: centerX, y: centerY), anchor: .center, proposal: .init(width: width, height: spanHeight))
            if index != subviews.endIndex - 1 {
                let nextSubview = subviews[index + 1]
                let (nextStart, nextEnd) = startEnd(subview: nextSubview, from: from)
                if nextStart < end || nextEnd > cols {
                    if spanHeight > 0 {
                        centerY += spanHeight / 2 + rowSpacing
                    }
                    from = 1
                    row += 1
                    spanHeight = cache.heights[row]
                    centerY += spanHeight / 2
                }
            }
        }
    }
    
    private func startEnd(subview: LayoutSubviews.Element, from: Int) -> (Int, Int) {
        var span = subview[GridLayout.Span.self]
        if let column = subview[GridLayout.Column.self] {
            switch column {
            case .full:
                span = cols
            }
        }
        let start = subview[GridLayout.Start.self]
        let end = subview[GridLayout.End.self]
        if let end {
            if let start {
                return (start, end - 1)
            } else {
                return (end - span, end - 1)
            }
        } else if let start {
            return (start, from + span)
        } else {
            return (from, from + span - 1)
        }
    }
    
    private func totalSpans(subviews: LayoutSubviews) -> Int {
        var from = 1
        var row = 1
        subviews.indices.forEach { index in
            let subview = subviews[index]
            let end = startEnd(subview: subview, from: from).1
            from = end + 1
            if index != subviews.endIndex - 1 {
                let nextSubview = subviews[index + 1]
                let (nextStart, nextEnd) = startEnd(subview: nextSubview, from: from)
                if nextStart < end || nextEnd > cols {
                    row += 1
                    from = 1
                }
            } else {
                from = 1
            }
        }
        return from - 1 + row * cols
    }
    
    init(cols: Int, gap: Gap) {
        self.cols = cols
        self.gap = gap
    }
}

public struct GridView<Content: View>: View {
    @Environment(\.breakpoint) var breakpoint
    
    let defaultCols: Int
    let smallCols: Int?
    let largeCols: Int?
    let defaultGap: GridLayout.Gap
    let largeGap: GridLayout.Gap?
    let content: Content
    
    private var cols: Int {
        if let largeCols, breakpoint >= .large {
            largeCols
        } else if let smallCols, breakpoint >= .small {
            smallCols
        } else {
            defaultCols
        }
    }
    
    private var gap: GridLayout.Gap {
        if let largeGap, breakpoint >= .large {
            largeGap
        } else {
            defaultGap
        }
    }
    
    public var body: some View {
        GridLayout(cols: cols, gap: gap) {
            content
        }
    }
    
    public init(cols: Int = 1, smallCols: Int? = nil, largeCols: Int? = nil, _ gap: GridLayout.Gap = .gap(.s0), large largeGap: GridLayout.Gap? = nil, @ViewBuilder content: () -> Content) {
        self.defaultCols = cols
        self.content = content()
        self.defaultGap = gap
        self.largeGap = largeGap
        self.smallCols = smallCols
        self.largeCols = largeCols
    }
}

#Preview {
    GridView(cols: 2) {
        Text("This sunny and spacious room is for those traveling light and looking for a comfy and cosy place to lay their head for a night or two. This beach house sits in a vibrant neighborhood littered with cafes, pubs, restaurants and supermarkets and is close to all the major attractions such as Edinburgh Castle and Arthur's Seat.")
        Rectangle()
    }
}

#Preview {
    ZStack {
        GridView(cols: 4, .gap(.s4)) {
            Group {
                Text("01")
                Text("02")
                Text("03")
                Text("04")
                Text("05")
                Text("06")
                Text("07")
                Text("08")
                Text("09")
            }
            .width(.full)
            .background(.pink)
            .foregroundStyle(.white)
            .rounded(.large)
            .fontWeight(.medium)
        }
        .width(.s96)
    }
}

#Preview {
    GridView(cols: 6, .gap(.s4)) {
        Group {
            Text("01")
                .col(span: 4)
                .col(start: 2)
            Text("02")
                .col(start: 1)
                .col(end: 3)
            Text("03")
                .col(end: 7)
                .col(span: 2)
            Text("04")
                .col(start: 1)
                .col(end: 7)
        }
        .width(.full)
        .height(.full)
        .background(.sky500)
        .foregroundStyle(.white)
        .rounded(.large)
        .fontWeight(.medium)
    }
    .width(.s96)
}

#Preview {
    GridView(cols: 3, .gap(.s4)) {
        Group {
            Text("01")
            Text("02")
            Text("03")
            Text("04")
                .col(span: 2)
            Text("05")
            Text("06")
            Text("07")
                .col(span: 2)
        }
        .width(.full)
        .height(.full)
        .background(.pink)
        .rounded(.large)
        .fontWeight(.medium)
        .foregroundStyle(.white)
    }
    .width(.s96)
}

#Preview {
    GridView(cols: 6, .gap(.s4)) {
        Group {
            Text("01")
                .col(span: 4)
            Text("02")
            Text("03")
                .col(span: 2)
            Text("04")
        }
        .width(.full)
        .height(.full)
        .background(.sky500)
        .foregroundStyle(.white)
        .rounded(.large)
        .fontWeight(.medium)
    }
    .width(.s96)
}

#Preview {
    Main {
        GridView(smallCols: 4, .gap(.s4)) {
            Group {
                Text("01")
                    .col(span: .full)
                    .height(.s60)
                Text("02")
                    .small(.col(span: 2))
                Text("03")
                    .small(.col(span: 2))
                Text("04")
                    .height(.s0)
            }
            .width(.full)
            .background(.pink)
            .foregroundStyle(.white)
            .rounded(.large)
            .fontWeight(.medium)
        }
    }
    .frame(width: 640)
}
