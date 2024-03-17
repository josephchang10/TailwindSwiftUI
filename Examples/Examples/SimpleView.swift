//
//  SimpleView.swift
//  Examples
//
//  Created by Jiafu Zhang on 3/17/24.
//

import SwiftUI

struct SimpleView: View {
    @State private var selectedSize: String = "XS"
    
    var body: some View {
        HStack {
            AsyncImage(url: .init(string: "https://images.unsplash.com/photo-1708443683202-a5be0ced5b8b")) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                ProgressView()
            }
            .width(.s48)
            .height(.full)
            .clipped()
            Form {
                HStack {
                    Text("Pullover Hoodie")
                        .text(.large)
                        .fontWeight(.semibold)
                        .foregroundStyle(.slate900)
                        .width(.full)
                    Text("$110.00")
                        .text(.large)
                        .fontWeight(.semibold)
                        .foregroundStyle(.slate500)
                }
                Text("In stock")
                    .width(.full)
                    .text(.small)
                    .fontWeight(.medium)
                    .foregroundStyle(.slate700)
                    .padding(.top, .s2)
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
                                        .background(.slate900)
                                        .foregroundStyle(.white)
                                } or: { view in
                                    view
                                        .foregroundStyle(.slate700)
                                }
                                .rounded(.large)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .text(.small)
                .padding(.bottom, .s6)
                .border(.slate200, .bottom)
                .padding(.top, .s4)
                .padding(.bottom, .s6)
                HStack(spacing: .scale(.s4)) {
                    HStack(spacing: .scale(.s4)) {
                        Button("Buy now") {}
                            .height(.s10)
                            .padding(.horizontal, .s6)
                            .background(.black)
                            .foregroundStyle(.white)
                            .rounded(.medium)
                            .buttonStyle(.plain)
                        Button("Add to bag") {}
                            .height(.s10)
                            .padding(.horizontal, .s6)
                            .border(.slate200, rounded: .medium)
                            .foregroundStyle(.slate900)
                            .buttonStyle(.plain)
                    }
                    .width(.full)
                    Button {} label: {
                        Image(systemName: "heart.fill")
                    }
                    .width(.s9)
                    .height(.s9)
                    .foregroundStyle(.slate300)
                    .border(.slate200, rounded: .medium)
                    .accessibilityLabel("Like")
                    .buttonStyle(.plain)
                }
                .padding(.bottom, .s6)
                .text(.small)
                .fontWeight(.medium)
                Text("Free shipping on all continental US orders.")
                    .text(.small)
                    .foregroundStyle(.slate700)
            }
            .padding(.s6)
            .width(.full)
        }
        .background(.white)
        .frame(width: 480, height: 300)
    }
}

#Preview {
    SimpleView()
}
