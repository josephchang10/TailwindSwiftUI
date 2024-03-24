//
//  ElegantView.swift
//  Examples
//
//  Created by Jiafu Zhang on 3/17/24.
//

import SwiftUI

struct ElegantView: View {
    @State private var selectedSize: String = "XS"
    
    var body: some View {
        HStack {
            AsyncImage(url: .init(string: "https://images.unsplash.com/photo-1559034750-cdab70a66b8e")) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                ProgressView()
            }
            .width(.s52)
            .height(.full)
            .clipped()
            Form {
                Text("Formal Strapless Gown")
                    .text(.extraLarge2, leading: nil)
                    .padding(.bottom, .s3)
                    .foregroundStyle(.slate900)
                HStack(alignment: .firstTextBaseline) {
                    Text("$350.00")
                        .width(.full, alignment: .leading)
                        .text(.large)
                        .fontWeight(.medium)
                        .foregroundStyle(.slate500)
                    Text("In stock")
                        .text(.extraSmall, leading: .s6)
                        .fontWeight(.medium)
                        .textCase(.uppercase)
                        .foregroundStyle(.slate500)
                }
                HStack(alignment: .firstTextBaseline, spacing: .scale(.s1)) {
                    ForEach(["XS", "S", "M", "L", "XL"], id: \.self) { size in
                        Button {
                            selectedSize = size
                        } label: {
                            Text(size)
                                .width(.s7)
                                .height(.s7)
                                .`if`(selectedSize == size) { view in
                                    view
                                        .fontWeight(.medium)
                                        .background(.slate100)
                                        .foregroundStyle(.slate900)
                                } or: { view in
                                    view
                                        .foregroundStyle(.slate500)
                                }
                                .rounded(.full)
                        }
                        .accessibilityLabel("\(size) size")
                        .accessibilityValue(selectedSize == size ? "selected" : "not selected")
                        .buttonStyle(.plain)
                    }
                }
                .text(.small)
                .fontWeight(.medium)
                .padding(.bottom, .s6)
                .border(.slate200, .bottom)
                .padding(.top, .s4)
                .padding(.bottom, .s6)
                HStack(spacing: .scale(.s4)) {
                    HStack(spacing: .scale(.s4)) {
                        Button("Buy now") {}
                            .width(.full)
                            .height(.s12)
                            .background(.slate900)
                            .foregroundStyle(.white)
                            .buttonStyle(.plain)
                        Button("Add to bag") {}
                            .width(.full)
                            .height(.s12)
                            .border(.slate200)
                            .foregroundStyle(.slate900)
                            .buttonStyle(.plain)
                    }
                    .textCase(.uppercase)
                    .fontWeight(.medium)
                    .kerning(.wider)
                    .width(.full)
                    .padding(.trailing, .s4)
                    Button {} label: {
                        Image(systemName: "heart.fill")
                    }
                    .width(.s12)
                    .height(.s12)
                    .foregroundStyle(.slate300)
                    .border(.slate200)
                    .accessibilityLabel("Like")
                    .buttonStyle(.plain)
                }
                .padding(.bottom, .s5)
                .text(.small)
                .fontWeight(.medium)
                Text("Free shipping on all continental US orders.")
                    .text(.small)
                    .foregroundStyle(.slate500)
            }
            .padding(.s6)
            .width(.full)
        }
        .fontDesign(.serif)
        .background(.white)
        .frame(width: 500)
        .padding()
    }
}

#Preview {
    ElegantView()
}
