//
//  FormStatesView.swift
//  Examples
//
//  Created by Jiafu Zhang on 4/1/24.
//

import SwiftUI

struct FormStatesView: View {
    @State private var password = "Bosco"
    
    var body: some View {
        Form {
            VStack(alignment: .leading, spacing: 0) {
                Text("Username")
                    .text(.small)
                    .fontWeight(.medium)
                    .foregroundStyle(.slate700)
                TextField("", text: .constant("tbone"))
                    .textFieldStyle(.input([.padding(.horizontal, .s1), .padding(.vertical, .s2)], default: [.border(.slate300, rounded: .medium), .shadow(.small)], disabled: [.background(.slate50), .foregroundStyle(.slate500), .border(.slate200, rounded: .medium)]))
                    .background(.white)
                    .padding(.top, .s1)
                    .width(.full)
                    .small(.text(.small))
                    .disabled(true)
            }
            VStack(alignment: .leading, spacing: 0) {
                Text("Password")
                    .text(.small)
                    .fontWeight(.medium)
                    .foregroundStyle(.slate700)
                SecureField("", text: $password)
                    .textFieldStyle(.input([.padding(.horizontal, .s1), .padding(.vertical, .s2), .shadow(.small)], default: [.border(.slate300, rounded: .medium), .ring(thickness: .t0)], focused: [.border(.sky500, rounded: .medium), .ring(.sky500, thickness: .t1, rounded: .medium)]))
                    .background(.white)
                    .padding(.top, .s1)
                    .width(.full)
                    .small(.text(.small))
            }
            .padding(.top, .s6)
            Button {} label: {
                Text("Save changes")
                    .padding(.horizontal, .s5)
                    .padding(.vertical, .s2_5)
                    .text(.small, leading: .s5)
                    .hover(.background(.sky700))
                    .background(.sky500)
                    .rounded(.medium)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
            }
            .width(.full, alignment: .trailing)
            .padding(.top, .s6)
            .buttonStyle(.plain)
        }
        .padding(.vertical, .s5)
        .padding(.horizontal, .s6)
        .background(.white)
        .max(width: .small)
    }
}

#Preview {
    FormStatesView()
}
