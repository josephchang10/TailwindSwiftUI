//
//  DarkModeView.swift
//  Examples
//
//  Created by Jiafu Zhang on 3/28/24.
//

import SwiftUI
import TailwindSwiftUI

struct DarkModeView: View {
    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: .s6) {
                HStack(spacing: .s4) {
                    Image("full-stack-radio.afb14e4e")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 88, height: 88)
                        .rounded(.large)
                        .background(.universalSlate100)
                    VStack(alignment: .leading, spacing: .s1) {
                        Group {
                            HStack(spacing: 0) {
                                Text("Ep.")
                                    .accessibilityAddTraits(.isHeader)
                                    .accessibilityLabel("Episode")
                                Text(" 128")
                            }
                            .dark(.foregroundStyle(.cyan400))
                            .foregroundStyle(.cyan500)
                            .text(.small)
                            Text("Scaling CSS at Heroku with Utility Classes")
                                .dark(.foregroundStyle(.slate400))
                                .foregroundStyle(.slate500)
                                .text(.small)
                            Text("Full Stack Radio")
                                .dark(.foregroundStyle(.slate50))
                                .foregroundStyle(.slate900)
                                .text(.large)
                        }
                        .padding(.vertical, 3)
                    }
                    .frame(minWidth: 0)
                    .fontWeight(.semibold)
                }
                VStack(spacing: .s2) {
                    ZStack {
                        ProgressView(value: 1456, total: 4550)
                            .accessibilityLabel("music progress")
                            .height(.s2)
                            .overlay(alignment: .leading) {
                                Dark {
                                    Color
                                        .cyan400
                                } otherwise: {
                                    Color.cyan500
                                }
                                .width(.half)
                            }
                            .dark(.background(.slate700))
                            .background(.slate100)
                            .rounded(.full)
                        Dark {
                            Circle()
                                .fill(.cyan400)
                        } otherwise: {
                            Circle()
                                .fill(.cyan500)
                        }
                        .width(.s1_5)
                        .height(.s1_5)
                        .ring(.slate900 / 5, thickness: .t1, inset: true)
                        .width(.s4)
                        .height(.s4)
                        .background(.white)
                        .rounded(.full)
                        .ring(.cyan500, thickness: .t2, rounded: .full)
                        .shadow()
                    }
                    HStack {
                        Text("24:16")
                            .dark(.foregroundStyle(.slate100))
                            .foregroundStyle(.cyan500)
                        Spacer()
                        Text("75:50")
                            .dark(.foregroundStyle(.slate400))
                            .foregroundStyle(.slate500)
                    }
                    .text(.small, leading: 6)
                    .fontWeight(.medium)
                    .monospacedDigit()
                }
            }
            .padding(.horizontal, .s4)
            .padding(.top, .s4)
            .padding(.bottom, .s6)
            .dark(.background(.slate800), otherwise: .background(.white))
            .dark(.border(.slate500, .bottom), otherwise: .border(.slate100, .bottom))
            .rounded(.top, .extraLarge)
            HStack {
                HStack {
                    Spacer()
                    Image(systemName: "bookmark.fill")
                        .accessibilityLabel("Add to favorites")
                    Spacer()
                    Button {} label: {
                        Image(systemName: "gobackward")
                            .fontWeight(.bold)
                    }
                    .accessibilityLabel("Previous")
                    Spacer()
                }
                Spacer()
                    .width(.s20)
                HStack {
                    Spacer()
                    Button {} label: {
                        Image(systemName: "goforward")
                            .fontWeight(.bold)
                    }
                    .accessibilityLabel("Skip 10 seconds")
                    Spacer()
                    Button {} label: {
                        Text("1x")
                            .padding(.vertical, 3)
                    }
                    .padding(.horizontal, .s2)
                    .dark(.background(.slate500), otherwise: .ring(.slate500, thickness: .t2, inset: true, rounded: .large))
                    .rounded(.large)
                    .dark(.foregroundStyle(.slate100))
                    .foregroundStyle(.slate500)
                    .text(.small, leading: 6)
                    .fontWeight(.semibold)
                    Spacer()
                }
            }
            .height(.s20)
            .padding(.vertical, -.s2)
            .dark(.background(.slate600), otherwise: .background(.slate50))
            .dark(.foregroundStyle(.slate200))
            .foregroundStyle(.slate500)
            .rounded(.bottom, .extraLarge)
            .buttonStyle(.plain)
            .overlay {
                Button {} label: {
                    Image(systemName: "pause")
                        .resizable()
                        .frame(width: .point(30), height: .point(32))
                }
                .width(.s20)
                .height(.s20)
                .dark(.background(.slate100), otherwise: .background(.white))
                .dark(.foregroundStyle(.slate700))
                .foregroundStyle(.slate900)
                .rounded(.full)
                .ring(.slate900 / 5, thickness: .t1, rounded: .full)
                .shadow(.medium)
                .accessibilityLabel("Pause")
                .buttonStyle(.plain)
            }
        }
        .padding(.s20)
        .width(.full)
        .height(.full)
        .background(.universalSky100)
    }
}

#Preview {
    DarkModeView()
        .padding()
        .background(.universalSky100)
}

#Preview {
    DarkModeView()
        .padding()
        .background(.universalSky100)
        .preferredColorScheme(.dark)
}
