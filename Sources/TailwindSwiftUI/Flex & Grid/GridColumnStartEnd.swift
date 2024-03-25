//
//  GridColumnStartEnd.swift
//  Utilities for controlling how elements are sized and placed across grid columns.
//
//  Created by Jiafu Zhang on 3/20/24.
//

import SwiftUI

extension GridLayout {
    struct Span: LayoutValueKey {
        static let defaultValue = 1
    }
    
    public struct Column: LayoutValueKey {
        public static let defaultValue: Span? = nil
        
        public enum Span {
            case full
        }
    }
    
    struct Start: LayoutValueKey {
        static let defaultValue: Int? = nil
    }
    
    struct End: LayoutValueKey {
        static let defaultValue: Int? = nil
    }
}

public extension View {
    func col(span: Int) -> some View {
        layoutValue(key: GridLayout.Span.self, value: span)
    }
    
    func col(span: GridLayout.Column.Span) -> some View {
        layoutValue(key: GridLayout.Column.self, value: span)
    }
    
    func col(start: Int) -> some View {
        layoutValue(key: GridLayout.Start.self, value: start)
    }
    
    func col(end: Int) -> some View {
        layoutValue(key: GridLayout.End.self, value: end)
    }
}

public struct Col: ViewModifier {
    var span: Int = 1
    var colSpan: GridLayout.Column.Span?
    
    public func body(content: Content) -> some View {
        content
            .`if`(colSpan == nil, then: { content in
                content
                    .col(span: span)
            }, or: { content in
                content
                    .col(span: colSpan!)
            })
    }
}

public extension ViewModifier where Self == Col {
    static func col(span: Int) -> Self {
        Col(span: span)
    }
    
    static func col(span: GridLayout.Column.Span) -> Self {
        Col(colSpan: span)
    }
}

// Basic usage

// Spanning columns
//
// Use the `.col(span: n)` view modifiers to make an element span n columns.
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
    .height(.s56)
}

// Starting and end lines
//
// Use the `.col(start: n)` and `.col(end: n)` view modifiers
// to make an element start or end at the *nth* grid line.
// These can also be combined with the `.col(span: n)` view
// modifiers to span a specific number of columns.
//
// Note that grid layout lines start at 1, not 0, so a
// full-width element in a 6-column grid would start at line 1
// and end at line 7.
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
