//
//  SizingView.swift
//  Examples
//
//  Created by Jiafu Zhang on 3/16/24.
//

import SwiftUI
import TailwindSwiftUI

struct SizingView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: .scale(.s4)) {
            Group {
                Text(".width(.s96)")
                    .width(.s96)
                Text(".width(.s80)")
                    .width(.s80)
                Text(".width(.s72)")
                    .width(.s72)
                Text(".width(.s64)")
                    .width(.s64)
                Text(".width(.s60)")
                    .width(.s60)
                Text(".width(.s56)")
                    .width(.s56)
                Text(".width(.s52)")
                    .width(.s52)
                Text(".width(.s48)")
                    .width(.s48)
                Text(".width(.s44)")
                    .width(.s44)
                Text(".width(.s40)")
                    .width(.s40)
                Text(".width(.s36)")
                    .width(.s36)
            }
            .background(.white)
            .rounded()
            .shadow()
        }
        .padding()
    }
}

#Preview {
    SizingView()
}
