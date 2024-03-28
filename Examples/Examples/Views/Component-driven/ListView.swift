//
//  ListView.swift
//  Examples
//
//  Created by Jiafu Zhang on 3/28/24.
//

import SwiftUI

struct ListView<Content: View>: View {
    let content: Content
    
    var body: some View {
        List {
            content
                .listRowSeparatorTint(.slate100)
        }
        .listStyle(.plain)
    }
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
}

#Preview {
    ListView {
        ForEach(0..<5) { index in
            Text("Row \(index)")
        }
    }
}
