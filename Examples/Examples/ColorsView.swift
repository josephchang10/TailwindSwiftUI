//
//  ColorsView.swift
//  Examples
//
//  Created by Jiafu Zhang on 3/16/24.
//

import SwiftUI

struct ColorsView: View {
    var body: some View {
        VStack {
            LazyVGrid(columns: Array(repeating: .init(.flexible(), spacing: .scale(.s2)), count: 10)) {
                Group {
                    Color.sky50
                    Color.sky100
                    Color.sky200
                    Color.sky300
                    Color.sky400
                    Color.sky500
                    Color.sky600
                    Color.sky700
                    Color.sky800
                    Color.sky900
                }
                .aspectRatio(1, contentMode: .fit)
            }
            LazyVGrid(columns: Array(repeating: .init(.flexible(), spacing: .scale(.s2)), count: 10)) {
                Group {
                    Color.blue50
                    Color.blue100
                    Color.blue200
                    Color.blue300
                    Color.blue400
                    Color.blue500
                    Color.blue600
                    Color.blue700
                    Color.blue800
                    Color.blue900
                }
                .aspectRatio(1, contentMode: .fit)
            }
            LazyVGrid(columns: Array(repeating: .init(.flexible(), spacing: .scale(.s2)), count: 10)) {
                Group {
                    Color.indigo50
                    Color.indigo100
                    Color.indigo200
                    Color.indigo300
                    Color.indigo400
                    Color.indigo500
                    Color.indigo600
                    Color.indigo700
                    Color.indigo800
                    Color.indigo900
                }
                .aspectRatio(1, contentMode: .fit)
            }
            LazyVGrid(columns: Array(repeating: .init(.flexible(), spacing: .scale(.s2)), count: 10)) {
                Group {
                    Color.violet50
                    Color.violet100
                    Color.violet200
                    Color.violet300
                    Color.violet400
                    Color.violet500
                    Color.violet600
                    Color.violet700
                    Color.violet800
                    Color.violet900
                }
                .aspectRatio(1, contentMode: .fit)
            }
        }
        .width(.s96)
        .padding()
    }
}

#Preview {
    ColorsView()
}
