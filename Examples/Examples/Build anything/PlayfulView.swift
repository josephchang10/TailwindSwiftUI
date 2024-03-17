//
//  PlayfulView.swift
//  Examples
//
//  Created by Jiafu Zhang on 3/17/24.
//

import SwiftUI

struct PlayfulView: View {
    @State private var selectedSize: String = "XS"
    
    var body: some View {
        HStack {
            AsyncImage(url: .init(string: "https://images.unsplash.com/photo-1568385247005-0d371d214a2c")) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                ProgressView()
            }
            .width(.s56)
            .height(.full)
            .rounded(.large)
            Form {
                HStack {
                    Text("Kids Dress")
                        .width(.full)
                        .fontWeight(.medium)
                        .foregroundStyle(.slate900)
                    Text("In stock")
                        .text(.small)
                        .fontWeight(.medium)
                        .foregroundStyle(.slate400)
                }
                Text("$39.00")
                    .padding(.top, .s2)
                    .text(.extraLarge3)
                    .fontWeight(.bold)
                    .foregroundStyle(.violet600)
                HStack(alignment: .firstTextBaseline, spacing: .scale(.s2)) {
                    ForEach(["XS", "S", "M", "L", "XL"], id: \.self) { size in
                        Button {
                            selectedSize = size
                        } label: {
                            Text(size)
                                .width(.s9)
                                .height(.s9)
                                .if(selectedSize == size) { view in
                                    view
                                        .fontWeight(.medium)
                                        .background(.violet600)
                                        .foregroundStyle(.white)
                                } or: { view in
                                    view
                                        .foregroundStyle(.violet400)
                                }
                                .rounded(.full)
                        }
                        .accessibilityLabel("\(size) size")
                        .accessibilityValue(selectedSize == size ? "selected" : "not selected")
                        .buttonStyle(.plain)
                    }
                }
                .text(.small)
                .fontWeight(.bold)
                .padding(.bottom, .s6)
                .border(.slate200, .bottom)
                .padding(.top, .s4)
                .padding(.bottom, .s6)
                HStack(spacing: .scale(.s4)) {
                    HStack(spacing: .scale(.s4)) {
                        Button("Buy now") {}
                            .height(.s10)
                            .padding(.horizontal, .s6)
                            .fontWeight(.semibold)
                            .background(.violet600)
                            .foregroundStyle(.white)
                            .rounded(.full)
                            .buttonStyle(.plain)
                        Button("Add to bag") {}
                            .height(.s10)
                            .padding(.horizontal, .s6)
                            .fontWeight(.semibold)
                            .border(.slate200, rounded: .full)
                            .foregroundStyle(.slate900)
                            .buttonStyle(.plain)
                    }
                    .width(.full)
                    Button {} label: {
                        Image(systemName: "heart.fill")
                    }
                    .width(.s9)
                    .height(.s9)
                    .foregroundStyle(.violet600)
                    .background(.violet50)
                    .rounded(.full)
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
        .background(.white)
        .rounded(.large)
        .frame(width: 500)
        .padding()
    }
}

#Preview {
    PlayfulView()
}
