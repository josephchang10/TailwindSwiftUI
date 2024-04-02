//
//  ModifiersView.swift
//  Examples
//
//  Created by Jiafu Zhang on 4/2/24.
//

import SwiftUI

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
