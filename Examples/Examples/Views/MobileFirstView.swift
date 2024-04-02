//
//  MobileFirstView.swift
//  Examples
//
//  Created by Jiafu Zhang on 3/18/24.
//

import SwiftUI
import TailwindSwiftUI

struct MobileFirstView: View {
    var body: some View {
        Main {
            ZStack {
                HStack {
                    GridView {
                        Large{} otherwise: {
                            ZStack {
                                images
                                Small {} otherwise: {
                                    property
                                }
                            }
                            .rounded(.large)
                        }
                        HStack {
                            VStack {
                                Small {
                                    property
                                }
                                HStack {
                                    HStack(spacing: 0) {
                                        Image(systemName: "star.fill")
                                            .padding(.trailing, .s1)
                                            .dark(.foregroundStyle(.indigo500))
                                        Text("4.89 ")
                                        Text("(128)")
                                            .foregroundStyle(.slate400)
                                    }
                                    .accessibilityLabel("Reviews")
                                    .foregroundStyle(.indigo600)
                                    HStack {
                                        Circle()
                                            .frame(width: 2)
                                            .padding(.horizontal, .s3)
                                            .foregroundStyle(.slate300)
                                        Image(systemName: "mappin.circle")
                                            .padding(.trailing, .s1)
                                            .dark(.foregroundStyle(.slate500), otherwise: .foregroundStyle(.slate400))
                                        Text("Santa Teresa, ES")
                                    }
                                    .accessibilityLabel("Location")
                                }
                                .small(.padding(.top, .s1), otherwise: .padding(.top, .s4))
                                .text(.small)
                                .fontWeight(.medium)
                                .width(.full, alignment: .leading)
                            }
                            Small {
                                Large {} otherwise: {
                                    checkAvailability
                                }
                            }
                        }
                        Small {
                            Large {
                                checkAvailability
                            }
                        } otherwise: {
                            checkAvailability
                        }
                        Text("Discover tranquility in our Cozy Cabin Retreat, nestled in the heart of Santa Teresa, ES, Brazil. This A-frame sanctuary offers stunning mountain views and a unique blend of rustic charm and modern comfort. Perfect for relaxation seekers, our cabin is surrounded by nature yet close to local cafes and cultural spots. Ideal for a serene getaway or a nature-filled adventure.")
                            .large(.padding(.top, .s6), default: .padding(.top, .s4))
                            .text(.small, leading: 6)
                            .width(.full, alignment: .leading)
                            .dark(.foregroundStyle(.slate400))
                    }
                    .large(.padding(.trailing, .s20))
                    Large {
                        images
                    }
                }
                .large(.max(width: .extraLarge5), default: .max(width: .extraLarge4))
            }
            .medium(.padding(.vertical, .s10), otherwise: .padding(.vertical, .s6))
            .medium(.padding(.horizontal, .s8), otherwise: .small(.padding(.horizontal, .s6), otherwise: .padding(.horizontal, .s4)))
            .width(.full, alignment: .center)
        }
        .dark(.foregroundStyle(.slate400), otherwise: .foregroundStyle(.slate500))
        .background(.white)
    }
    
    var property: some View {
        VStack(alignment: .leading) {
            Text("Entire house")
                .text(.small, leading: 4)
                .fontWeight(.medium)
            Text("Cabin Retreat in Santa Teresa")
                .padding(.top, .s1)
                .text(.large)
                .fontWeight(.semibold)
        }
        .small(.foregroundStyle(.slate900), otherwise: .foregroundStyle(.white))
        .small(otherwise: .padding(.s3))
        .width(.full, alignment: .leading)
        .small(otherwise: .height(.s60, alignment: .bottomLeading))
        .small(.background(.clear), otherwise: .backgroundGradient(to: .right, from: .black / 75, via: .black / 0))
    }
    
    var checkAvailability: some View {
        Button {} label: {
            Text("Check availability")
                .foregroundStyle(.white)
                .text(.small, leading: 6)
                .fontWeight(.medium)
                .padding(.vertical, .s2)
                .padding(.horizontal, .s3)
                .background(.indigo600)
                .rounded(.large)
        }
        .small(.large(.padding(.top, .s6)), otherwise: .padding(.top, .s4))
        .small(.large(.width(.full, alignment: .leading), otherwise: .width(.full, alignment: .trailing)), otherwise: .width(.full, alignment: .leading))
        .buttonStyle(.plain)
    }
    
    var images: some View {
        GridView(smallCols: 4, .gap(.s4), large: .gap(.s6)) {
            Image("CabinRetreat")
                .resizable()
                .scaledToFill()
                .small(.height(.s52), otherwise: .height(.s60))
                .rounded(.large)
                .small(.col(span: 2))
                .large(.col(span: .full))
            Group {
                Object(.cover) {
                    Image("CabinRetreatInterior")
                    .resizable()
                }
                .large(.col(span: 2), default: .medium(.col(span: 1), otherwise: .col(span: 2)))
                .small(.height(.s52), otherwise: .height(.s0))
                .large(.height(.s32))
                Object(.cover) {
                    Image("CabinRetreatExterior")
                    .resizable()
                }
                .medium(.height(.s52), otherwise: .height(.s0))
                .large(.height(.s32))
                .large(.col(span: 2))
            }
            .rounded(.large)
        }
        .large(.padding(.bottom, .s0), default: .small(.padding(.bottom, .s6)))
    }
}

#Preview {
    MobileFirstView()
        .frame(height: 410)
}

#Preview {
    GridView(smallCols: 4, .gap(.s4)) {
        Image("CabinRetreat")
            .resizable()
            .scaledToFill()
            .height(.s60)
            .rounded(.large)
            .small(.col(span: 2))
        Group {
            Object(.cover) {
                Image("CabinRetreatInterior")
                .resizable()
            }
            Object(.cover) {
                Image("CabinRetreatExterior")
                .resizable()
            }
        }
        .rounded(.large)
        .col(span: 2)
        .small(.height(.s52), otherwise: .height(.s0))
    }
}
