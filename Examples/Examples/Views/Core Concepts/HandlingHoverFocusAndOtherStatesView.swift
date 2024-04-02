//
//  HandlingHoverFocusAndOtherStatesView.swift
//  Examples
//
//  Created by Jiafu Zhang on 4/1/24.
//

import SwiftUI
import TailwindSwiftUI

struct HoverView: View {
    var body: some View {
        Button {} label: {
            Text("Save changes")
                .padding(.horizontal, .s5)
                .padding(.vertical, .s2)
                .hover(.background(.sky700), default: .background(.sky500))
                .text(.small, leading: 5)
                .rounded(.full)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
        }
        .cursorPointer()
        .buttonStyle(.plain)
        .padding(.horizontal, .s64)
        .padding(.vertical, .s10)
        .background(.universalSlate100)
    }
}

#Preview {
    HoverView()
}

struct TraditionalHoverView: View {
    @State private var isHovering = false
    
    var body: some View {
        Button {} label: {
            Text("Save changes")
                .background(isHovering ? Color(red: 3 / 255, green: 105 / 255, blue: 161 / 255) : Color(red: 14 / 255, green: 165 / 255, blue: 233 / 255))
        }
        .onHover { hovering in
            isHovering = hovering
        }
    }
}

#Preview {
    TraditionalHoverView()
}

struct ModifiersView: View {
    var body: some View {
        Button {} label: {
            Text("Save changes")
        }
        .dark(.medium(.hover(.background(.fuchsia600))))
    }
}

#Preview {
    ModifiersView()
}

struct HoverViewModifierView: View {
    var body: some View {
        Button {} label: {
            Text("Save changes")
                .padding(.horizontal, .s5)
                .padding(.vertical, .s2)
                .text(.small, leading: 5)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
        }
        .hover(.background(.violet600), default: .background(.violet500))
        .buttonStyle(.active(.background(.violet700)))
        .rounded(.full)
        .cursorPointer()
        .padding(.horizontal, .s64)
        .padding(.vertical, .s10)
        .background(.universalSlate100)
    }
}

#Preview {
    HoverViewModifierView()
}

struct FirstLastView: View {
    struct Person: Identifiable {
        let name: String
        let imageURL: URL?
        let email: String
        
        var id: some Hashable {
            name
        }
    }
    
    let people = [
        Person(name: "Kristen Ramos", imageURL: .init(string: "https://images.unsplash.com/photo-1550525811-e5869dd03032?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80"), email: "kristen.ramos@example.com"),
        Person(name: "Floyd Miles", imageURL: .init(string: "https://images.unsplash.com/photo-1463453091185-61582044d556?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80"), email: "floyd.miles@example.com"),
        Person(name: "Courtney Henry", imageURL: .init(string: "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80"), email: "courtney.henry@example.com"),
        Person(name: "Ted Fox", imageURL: .init(string: "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80"), email: "ted.fox@example.com")
    ]
    
    var body: some View {
        // Remove top/bottom padding when first/last child
        UnorderedList(people, divide: .slate200, first: .padding(.bottom, .s4), last: .padding(.top, .s4), default: .padding(.vertical, .s4)) { person in
            HStack(spacing: 0) {
                AsyncImage(url: person.imageURL) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .width(.s10)
                .height(.s10)
                .rounded(.full)
                VStack(alignment: .leading) {
                    Text(person.name)
                        .fontWeight(.medium)
                        .foregroundStyle(.slate900)
                    Text(person.email)
                        .foregroundStyle(.slate500)
                }
                .text(.small)
                .padding(.leading, .s3)
            }
            .width(.full, alignment: .leading)
        }
        .padding(.s6)
        .max(width: .medium)
        .background(.white)
        .shadow()
        .padding(.horizontal, .s32)
        .background(.universalSlate100)
    }
}

#Preview {
    FirstLastView()
}

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
