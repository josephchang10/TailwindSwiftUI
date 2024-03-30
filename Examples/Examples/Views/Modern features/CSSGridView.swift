//
//  CSSGridView.swift
//  Examples
//
//  Created by Jiafu Zhang on 3/30/24.
//

import SwiftUI
import TailwindSwiftUI

struct CSSGridView: View {
    var body: some View {
        GridView(cols: 3, .gap(.s8)) {
            Group {
                Image("mountains-1")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 110)
                Image("mountains-2")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 110)
                    .col(start: 2)
                    .col(end: 4)
                Image("mountains-3")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 110)
                Image("mountains-4")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 110)
                Image("mountains-5")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 110)
            }
            .rounded(.large)
            .shadow(.large)
        }
        .frame(width: 393)
        .padding(.s20)
        .width(.full)
        .height(.full)
        .background(.universalIndigo50)
    }
}

#Preview {
    CSSGridView()
}
