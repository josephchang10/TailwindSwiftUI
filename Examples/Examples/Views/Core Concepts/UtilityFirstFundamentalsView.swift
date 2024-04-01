//
//  UtilityFirstFundamentalsView.swift
//  Examples
//
//  Created by Jiafu Zhang on 3/31/24.
//

import SwiftUI
import TailwindSwiftUI

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

struct ResponsiveView: View {
    var body: some View {
        Flex(.small, horizontalSpacing: .s4, verticalSpacing: .s2) {
            AsyncImage(url: .init(string: "https://tailwindcss.com/img/erin-lindford.jpg")) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .height(.s24)
                    .rounded(.full)
            } placeholder: {
                ProgressView()
            }
            .accessibilityLabel("Woman's Face")
            VStack(alignment: .leading, spacing: .s3_5) {
                VStack(alignment: .leading, spacing: .s1_5) {
                    Text("Erin Lindford")
                        .text(.large)
                        .foregroundStyle(.black)
                        .fontWeight(.semibold)
                        .small(otherwise: .width(.full, alignment: .center))
                    Text("Product Engineer")
                        .foregroundStyle(.slate500)
                        .fontWeight(.medium)
                        .small(otherwise: .width(.full, alignment: .center))
                }
                Button {} label: {
                    Text("Message")
                        .padding(.horizontal, .s4)
                        .padding(.vertical, .s1)
                        .text(.small)
                        .hover { content in
                            content
                                .foregroundStyle(.white)
                                .background(.purple600)
                                .ring(.purple600, thickness: .t2, offset: .init(width: .s2))
                                .rounded(.full)
                        } otherwise: { content in
                            content
                                .foregroundStyle(.purple600)
                                .border(.purple200, rounded: .full)
                        }
                        .fontWeight(.semibold)
                        .cursorPointer()
                }
                .small(otherwise: .width(.full, alignment: .center))
                .buttonStyle(.plain)
            }
        }
        .padding(.s8)
        .max(width: .small)
        .background(.white)
        .rounded(.extraLarge)
        .shadow(.large)
        .padding(.horizontal, .s20)
        .main()
        .background(.universalSlate100)
    }
}

#Preview {
    ResponsiveView()
}
