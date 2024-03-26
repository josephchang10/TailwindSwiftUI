//
//  StateVariantsView.swift
//  Examples
//
//  Created by Jiafu Zhang on 3/25/24.
//

import SwiftUI
import TailwindSwiftUI

struct StateVariantsView: View {
    @FocusState private var isFocused: Bool
    
    var body: some View {
        Section {
            
        } header: {
            VStack(spacing: .scale(.s4)) {
                HStack {
                    Text("Projects")
                        .fontWeight(.semibold)
                        .foregroundStyle(.slate900)
                    Spacer()
                    Link(destination: .init(string: "/new")!) {
                        Image(systemName: "plus")
                            .padding(.trailing, .s2)
                        Text("New")
                    }
                    .padding(.leading, .s2)
                    .padding(.trailing, .s3)
                    .padding(.vertical, .s2)
                    .hover(.background(.blue400), otherwise: .background(.blue500))
                    .rounded(.medium)
                    .foregroundStyle(.white)
                    .text(.small)
                    .fontWeight(.medium)
                    .shadow(.small)
                }
                Form {
                    HStack(spacing: 0) {
                        Image(systemName: "magnifyingglass")
                            .if(isFocused, then: { image in
                                image
                                    .foregroundStyle(.blue500)
                            }, or: { image in
                                image
                                    .dark(.foregroundStyle(.slate500), otherwise: .foregroundStyle(.slate400))
                            })
                            .padding(.leading, .s3)
                        TextField("", text: .constant(""), prompt: Text("Filter projects...")
                            .foregroundStyle(.slate400)
                        )
                            .focused($isFocused)
                            .textFieldStyle(.plain)
                            .text(.small, leading: 6)
                            .height(.s6)
                            .foregroundStyle(.slate900)
                            .padding(.vertical, .s2)
                            .shadow(.small)
                            .accessibilityLabel("Filter projects")
                    }
                    .rounded(.medium)
                    .ring(isFocused: isFocused, focus: .blue500, thickness: .t2, otherwise: .slate200, thickness: .t1, rounded: .medium)
                }
            }
            .padding(.s4)
            .background(.white)
        }
    }
}

#Preview {
    StateVariantsView()
}
