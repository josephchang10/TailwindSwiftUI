//
//  ShadowsView.swift
//  Examples
//
//  Created by Jiafu Zhang on 3/16/24.
//

import SwiftUI

struct ShadowsView: View {
    var body: some View {
        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: .scale(.s4)), count: 2), spacing: .scale(.s6)) {
            Group {
                Text(".shadow(.small)")
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
                    .background(.white)
                    .rounded(.large)
                    .boxShadow(.small)
                Text(".shadow()")
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
                    .background(.white)
                    .rounded(.large)
                    .boxShadow()
                Text(".shadow(.medium)")
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
                    .background(.white)
                    .rounded(.large)
                    .boxShadow(.medium)
                Text(".shadow(.large)")
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
                    .background(.white)
                    .rounded(.large)
                    .boxShadow(.large)
                Text(".shadow(.extraLarge)")
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
                    .background(.white)
                    .rounded(.large)
                    .boxShadow(.extraLarge)
                Text(".shadow(.extraLarge2)")
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
                    .background(.white)
                    .rounded(.large)
                    .boxShadow(.extraLarge2)
            }
            .height(.s20)
        }
        .frame(width: 400)
        .padding(.s16)
    }
}

#Preview {
    ShadowsView()
}
