//
//  TypographyView.swift
//  Examples
//
//  Created by Jiafu Zhang on 3/16/24.
//

import SwiftUI

struct TypographyView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: .scale(.s5)) {
            Group {
                VStack(alignment: .leading) {
                    Text(".fontDesign(.default)")
                        .text(.small)
                        .border(.bottom)
                    Text("The quick brown fox jumps over the lazy dog.")
                        .fontDesign(.default)
                }
                VStack(alignment: .leading) {
                    Text(".fontDesign(.serif)")
                        .text(.small)
                        .border(.bottom)
                    Text("The quick brown fox jumps over the lazy dog.")
                        .fontDesign(.serif)
                }
                VStack(alignment: .leading) {
                    Text(".fontDesign(.monospaced)")
                        .text(.small)
                        .border(.bottom)
                    Text("The quick brown fox jumps over the lazy dog.")
                        .fontDesign(.monospaced)
                }
            }
            .padding(.s3)
            .background(.white)
            .rounded(.large)
            .shadow()
        }
        .padding()
    }
}

#Preview {
    TypographyView()
}
