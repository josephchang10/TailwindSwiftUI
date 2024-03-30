//
//  TransformsView.swift
//  Examples
//
//  Created by Jiafu Zhang on 3/30/24.
//

import SwiftUI
import TailwindSwiftUI

struct TransformsView: View {
    var body: some View {
        GridView(cols: 3, .gap(.s8)) {
            Image("mountains-1")
                .resizable()
                .scaledToFill()
                .frame(height: 110)
                .rounded(.large)
                .shadow(.large)
                .scaleEffect(1.1)
                .rotationEffect(.degrees(-6))
            Image("mountains-2")
                .resizable()
                .scaledToFill()
                .frame(height: 110)
                .col(start: 2)
                .col(end: 4)
                .rounded(.large)
                .shadow(.large)
                .scaleEffect(0.75)
                .offset(x: 80, y: 16)
            Image("mountains-3")
                .resizable()
                .scaledToFill()
                .frame(height: 110)
                .rounded(.large)
                .shadow(.large)
                .scaleEffect(x: 1.5, anchor: .trailing)
                .offset(y: 44)
            Image("mountains-4")
                .resizable()
                .scaledToFill()
                .frame(height: 110)
                .rounded(.large)
                .shadow(.large)
                .offset(y: 96)
            Image("mountains-5")
                .resizable()
                .scaledToFill()
                .frame(height: 110)
                .rounded(.large)
                .shadow(.large)
                .offset(x: 8, y: 60)
                .scaleEffect(0.75)
                .rotationEffect(.degrees(6))
        }
        .frame(width: 393)
        .padding(.horizontal, .s10)
        .padding(.top, .s20)
        .padding(.bottom, .s52)
        .width(.full)
        .height(.full)
        .background(.universalIndigo50)
    }
}

#Preview {
    TransformsView()
}
