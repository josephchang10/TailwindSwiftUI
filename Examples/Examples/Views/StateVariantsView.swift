//
//  StateVariantsView.swift
//  Examples
//
//  Created by Jiafu Zhang on 3/25/24.
//

import SwiftUI
import TailwindSwiftUI

struct Project: Identifiable {
    struct User: Identifiable {
        let avatar: URL?
        let name: String
        
        var id: some Hashable {
            avatar
        }
    }
    
    let url: URL
    let title: String
    let category: String
    let users: [User]
    
    var id: String {
        title
    }
}

struct StateVariantsView: View {
    @FocusState private var isFocused: Bool
    
    let projects = [
        Project(url: .init(string: "/api-integration")!, title: "API Integration", category: "Engineering", users: [
            .init(avatar: .init(string: "https://images.unsplash.com/photo-1531123897727-8f129e1688ce?auto=format&fit=facearea&facepad=2&w=48&h=48&q=80"), name: ""),
            .init(avatar: .init(string: "https://images.unsplash.com/photo-1494790108377-be9c29b29330?auto=format&fit=facearea&facepad=2&w=48&h=48&q=80"), name: ""),
            .init(avatar: .init(string: "https://images.unsplash.com/photo-1552374196-c4e7ffc6e126?auto=format&fit=facearea&facepad=2&w=48&h=48&q=80"), name: ""),
            .init(avatar: .init(string: "https://images.unsplash.com/photo-1546525848-3ce03ca516f6?auto=format&fit=facearea&facepad=2&w=48&h=48&q=80"), name: ""),
            .init(avatar: .init(string: "https://images.unsplash.com/photo-1544005313-94ddf0286df2?auto=format&fit=facearea&facepad=2&w=48&h=48&q=80"), name: "")
        ]),
        Project(url: .init(string: "/new-benefits-plan")!, title: "New Benefits Plan", category: "Human Resources", users: [
            .init(avatar: .init(string: "https://images.unsplash.com/photo-1517841905240-472988babdf9?auto=format&fit=facearea&facepad=2&w=48&h=48&q=80"), name: ""),
            .init(avatar: .init(string: "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?auto=format&fit=facearea&facepad=2&w=48&h=48&q=80"), name: ""),
            .init(avatar: .init(string: "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?auto=format&fit=facearea&facepad=2&w=48&h=48&q=80"), name: ""),
            .init(avatar: .init(string: "https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=facearea&facepad=2&w=48&h=48&q=80"), name: ""),
            .init(avatar: .init(string: "https://images.unsplash.com/photo-1502685104226-ee32379fefbe?auto=format&fit=facearea&facepad=2&w=48&h=48&q=80"), name: "")
        ])
    ]
    
    var body: some View {
        List {
            Section {
                VStack(spacing: .s4) {
                    ForEach(projects) { project in
                        Link(destination: project.url) {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(project.title)
                                        .accessibilityLabel("Title")
                                        .fontWeight(.semibold)
                                        .groupHover(.foregroundStyle(.white), otherwise: .foregroundStyle(.slate900))
                                    Text(project.category)
                                        .accessibilityLabel("Category")
                                        .groupHover(.foregroundStyle(.blue200))
                                }
                                HStack(spacing: -.s1_5) {
                                    ForEach(project.users) { user in
                                        AsyncImage(url: user.avatar) { image in
                                            image
                                                .resizable()
                                        } placeholder: {
                                            ProgressView()
                                        }
                                        .accessibilityLabel(user.name)
                                        .scaledToFill()
                                        .width(.s6)
                                        .height(.s6)
                                        .background(.slate100)
                                        .rounded(.full)
                                        .ring(.white, thickness: .t2, rounded: .full)
                                    }
                                }
                                .accessibilityLabel("Users")
                                .justifyEnd()
                            }
                        }
                        .padding(.s3)
                        .cursorPointer()
                        .hover(.background(.blue500), otherwise: .background(.white))
                        .rounded(.medium)
                        .ring(.slate200, thickness: .t1, rounded: .medium)
                        .shadow(.small)
                        .group()
                    }
                    Link(destination: .init(string: "/new")!) {
                        VStack {
                            Image(systemName: "plus")
                                .padding(.bottom, .s1)
                                .groupHover(.foregroundStyle(.blue500), otherwise: .foregroundStyle(.slate400))
                            Text("New Project")
                        }
                    }
                    .width(.full)
                    .padding(.vertical, .s3)
                    .group()
                    .hover { view in
                        view
                            .border(.solid, .blue500, width: 2, rounded: .medium)
                            .background(.white)
                            .foregroundStyle(.blue500)
                    } otherwise: { view in
                        view
                            .border(.dashed, .slate300, width: 2, rounded: .medium)
                    }
                    .text(.small, leading: 6)
                    .foregroundStyle(.slate900)
                    .fontWeight(.medium)
                    .cursorPointer()
                }
                .padding(.s4)
                .text(.small, leading: 6)
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
                            .height(.s6)
                            .foregroundStyle(.slate900)
                            .padding(.vertical, .s2)
                            .accessibilityLabel("Filter projects")
                        }
                        .rounded(.medium)
                        .ring(isFocused: isFocused, focus: .blue500, thickness: .t2, otherwise: .slate200, thickness: .t1, rounded: .medium)
                        .background(.white)
                        .compositingGroup()
                        .shadow(.small)
                    }
                }
                .padding(.s4)
                .background(.white)
            }
            .listRowSeparator(.hidden)
        }
        .background(.slate50)
        .foregroundStyle(.slate500)
        .listStyle(.plain)
        .scrollContentBackground(.hidden)
    }
}

#Preview {
    StateVariantsView()
}
