//
//  FiltersView.swift
//  Examples
//
//  Created by Jiafu Zhang on 3/30/24.
//

import SwiftUI
import TailwindSwiftUI

struct FiltersView: View {
    var body: some View {
        GridView(cols: 3, .gap(.s8)) {
            Image("mountains-1")
                .resizable()
                .scaledToFill()
                .frame(height: 110)
                .rounded(.large)
                .shadow(.large)
                .blur()
            Image("mountains-2")
                .resizable()
                .scaledToFill()
                .frame(height: 110)
                .col(start: 2)
                .col(end: 4)
                .rounded(.large)
                .shadow(.large)
                .colorInvert()
            Image("mountains-3")
                .sepia()
                .resizable()
                .scaledToFill()
                .frame(height: 110)
                .rounded(.large)
                .shadow(.large)
            Image("mountains-4")
                .resizable()
                .scaledToFill()
                .frame(height: 110)
                .rounded(.large)
                .shadow(.large)
                .grayscale()
            Image("mountains-5")
                .resizable()
                .scaledToFill()
                .frame(height: 110)
                .rounded(.large)
                .shadow(.large)
                .saturation(2)
        }
        .frame(width: 393)
        .padding(.s20)
        .width(.full)
        .height(.full)
        .background(.universalIndigo50)
    }
}

#Preview {
    FiltersView()
}
