//
//  StateVariantsView.swift
//  Examples
//
//  Created by Jiafu Zhang on 3/25/24.
//

import SwiftUI
import TailwindSwiftUI

struct StateVariantsView: View {
    var body: some View {
        Section {
            
        } header: {
            HStack {
                Text("Projects")
                    .fontWeight(.semibold)
                    .foregroundStyle(.slate900)
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
        }
    }
}

#Preview {
    StateVariantsView()
}
