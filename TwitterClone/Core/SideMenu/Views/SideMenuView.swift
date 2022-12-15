//
//  SideMenuView.swift
//  TwitterClone
//
//  Created by Bence Papp on 2022. 12. 15..
//

import SwiftUI

struct SideMenuView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Circle()
                .frame(width: 44, height: 44)

            VStack(alignment: .leading, spacing: 4) {
                Text("Bruce Wayne")
                    .font(.headline)

                Text("@batman")
                    .font(.caption)
                    .foregroundColor(.gray)
            }

            UserStatsView()
                .padding(.vertical)
        }
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}
