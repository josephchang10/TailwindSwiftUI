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
                .resizable()
                .frame(width: 39, height: 39)
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
        .background {
            Color.black.opacity(0.1)
                .padding(.horizontal, 3)
                .padding(.vertical, 3)
                .offset(x: 0, y: 10)
                .blur(radius: 15)
        }
        .background {
            Color.black.opacity(0.1)
                .padding(.horizontal, 4)
                .padding(.vertical, 4)
                .offset(x: 0, y: 4)
                .blur(radius: 6)
        }
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
                .resizable()
                .width(.s12)
                .height(.s12)
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
