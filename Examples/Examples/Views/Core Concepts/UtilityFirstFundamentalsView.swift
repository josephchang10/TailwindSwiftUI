//
//  UtilityFirstFundamentalsView.swift
//  Examples
//
//  Created by Jiafu Zhang on 3/31/24.
//

import SwiftUI

struct TraditionalView: View {
    var body: some View {
        HStack(spacing: 13) {
            Image("logo")
            VStack(alignment: .leading) {
                Text("ChitChat")
                    .font(.system(size: 16.25))
                    .lineSpacing(6.5)
                    .fontWeight(.medium)
                    .foregroundStyle(.black)
                Text("You have a new message!")
                    .foregroundStyle(Color(red: 100 / 255, green: 116 / 255, blue: 139 / 255, opacity: 1))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(20)
        .frame(maxWidth: 312)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .boxShadow(type: .color(c: .black.opacity(0.1)), radius: 15, offset: .init(x: 0, y: 10), spread: .init(width: -3, height: -3))
        .boxShadow(type: .color(c: .black.opacity(0.1)), radius: 6, offset: .init(x: 0, y: 4), spread: .init(width: -4, height: -4))
        .padding(65)
        .background(Color(red: 248 / 255, green: 250 / 255, blue: 252 / 255))
    }
}

#Preview {
    TraditionalView()
}

struct UtilitiesView: View {
    var body: some View {
        HStack(spacing: .s4) {
            Image("logo")
            VStack(alignment: .leading) {
                Text("ChitChat")
                    .text(.extraLarge)
                    .fontWeight(.medium)
                    .foregroundStyle(.black)
                Text("You have a new message!")
                    .foregroundStyle(.slate500)
            }
            .width(.full, alignment: .leading)
        }
        .padding(.s6)
        .max(width: .small)
        .background(.white)
        .rounded(.extraLarge)
        .shadow(.large)
        .padding(.s20)
        .background(.universalSlate50)
    }
}

#Preview {
    UtilitiesView()
}
