//
//  FirstLastView.swift
//  Examples
//
//  Created by Jiafu Zhang on 4/2/24.
//

import SwiftUI
import TailwindSwiftUI

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
