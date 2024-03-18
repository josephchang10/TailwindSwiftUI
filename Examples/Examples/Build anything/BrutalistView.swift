//
//  BrutalistView.swift
//  Examples
//
//  Created by Jiafu Zhang on 3/18/24.
//

import SwiftUI

struct BrutalistView: View {
    @State private var selectedSize: String = "XS"
    
    var body: some View {
        HStack {
            AsyncImage(url: .init(string: "https://images.unsplash.com/photo-1593169158019-e33d5a325c4c")) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 148, height: 200)
                    .clipped()
                    .background {
                        Color.teal400
                            .top(.s1)
                            .left(.s1)
                            .bottom(.n1)
                            .right(.n1)
                    }
            } placeholder: {
                ProgressView()
            }
            .width(.s48)
            .padding(.bottom, .s10)
            .zIndex(10)
            Form {
                VStack {
                    Text("Retro Shoe")
                        .width(.full, alignment: .leading)
                        .text(.extraLarge2)
                        .padding(.bottom, .s2)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                    HStack(alignment: .firstTextBaseline) {
                        Text("$350.00")
                            .text(.large)
                            .foregroundStyle(.white)
                        Text("In stock")
                            .textCase(.uppercase)
                            .foregroundStyle(.teal400)
                            .padding(.leading, .s3)
                    }
                    .width(.full, alignment: .leading)
                }
                .padding(.bottom, .s6)
                .background(
                    Color.black
                        .top(.n6)
                        .left(.n64)
                        .right(.n6)
                )
                HStack(alignment: .firstTextBaseline, spacing: .scale(.s3)) {
                    ForEach(["XS", "S", "M", "L", "XL"], id: \.self) { size in
                        Button {
                            selectedSize = size
                        } label: {
                            Text(size)
                                .width(.s10)
                                .height(.s10)
                                .if(selectedSize == size) { view in
                                    view
                                        .background(.black)
                                        .foregroundStyle(.white)
                                        .background {
                                            Color.teal400
                                                .top(.s0_5)
                                                .left(.s0_5)
                                                .bottom(.n0_5)
                                                .right(.n0_5)
                                        }
                                } or: { view in
                                    view
                                        .foregroundStyle(.black)
                                }
                        }
                        .accessibilityLabel("\(size) size")
                        .accessibilityValue(selectedSize == size ? "selected" : "not selected")
                        .buttonStyle(.plain)
                    }
                }
                .text(.small)
                .fontWeight(.medium)
                .padding(.vertical, .s6)
                HStack(spacing: .scale(.s2)) {
                    HStack(spacing: .scale(.s4)) {
                        Button("Buy now") {}
                            .padding(.horizontal, .s6)
                            .height(.s12)
                            .border(.black, width: 2)
                            .background(.teal400)
                            .foregroundStyle(.black)
                        Button("Add to bag") {}
                            .padding(.horizontal, .s6)
                            .height(.s12)
                            .border(.slate200)
                            .foregroundStyle(.slate900)
                    }
                    .textCase(.uppercase)
                    .fontWeight(.semibold)
                    .kerning(.wider)
                    Button {} label: {
                        Image(systemName: "heart.fill")
                    }
                    .width(.s12)
                    .height(.s12)
                    .foregroundStyle(.black)
                    .accessibilityLabel("Like")
                }
                .padding(.bottom, .s4)
                .text(.small)
                .fontWeight(.medium)
                .buttonStyle(.plain)
                Text("Free shipping on all continental US orders.")
                    .text(.extraSmall, leading: .s6)
                    .foregroundStyle(.slate500)
            }
            .padding(.leading, .s6)
            .width(.full)
        }
        .fontDesign(.monospaced)
        .frame(width: 500)
        .padding()
        .background(.white)
    }
}

#Preview {
    BrutalistView()
}
