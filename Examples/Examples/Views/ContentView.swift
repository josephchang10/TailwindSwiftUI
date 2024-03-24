//
//  ContentView.swift
//  Examples
//
//  Created by Jiafu Zhang on 3/15/24.
//

import SwiftUI
import TailwindSwiftUI

struct ContentView: View {
    var body: some View {
        Flex(.medium) {
            AsyncImage(
                url: .init(string: "https://images.unsplash.com/photo-1706820643404-71812d9d7d3a?w=384"),
                content: { image in
                    image
                        .resizable()
                        .scaledToFill()
                }, placeholder: {
                    ProgressView()
                }
            )
            .width(.s24)
            .height(.s24)
            .medium(.width(.s48))
            .medium(.height(.auto))
            .medium(.rounded(.none), otherwise: .rounded(.full))
            VStack(spacing: .scale(.s4)) {
                Group {
                    Text("4 Hikers perched a top Wanaka's highest mountain to watch the sun rise in New Zealand's South Island")
                        .text(.large)
                    VStack {
                        Group {
                            Text("Nick Da Fonseca")
                                .foregroundStyle(.sky500)
                                .dark(.foregroundStyle(.sky400))
                            Text("Roys Peak, Wānaka, New Zealand")
                                .dark(.foregroundStyle(.slate500), otherwise: .foregroundStyle(.slate700))
                        }
                        .medium(.frame(maxWidth: .infinity, alignment: .leading))
                    }
                }
                .medium(.frame(maxWidth: .infinity, alignment: .leading))
                .medium(.multilineTextAlignment(.leading), otherwise: .multilineTextAlignment(.center))
                .fontWeight(.medium)
            }
            .medium(.padding(.s8), otherwise: .padding(.top, .s6))
        }
        .medium(.padding(.s0), otherwise: .padding(.s8))
        .background(.slate100)
        .dark(.background(.slate800))
        .rounded(.extraLarge)
        .padding()
    }
}

#Preview {
    ContentView()
}
