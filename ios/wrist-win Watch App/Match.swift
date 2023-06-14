//
//  Match.swift
//  wrist-win Watch App
//
//  Created by Joris Douven on 14/06/2023.
//

import SwiftUI

struct Match: View {
    let scoreSetting: String
    let gameMode: String
    var body: some View {
        HStack {
            Button(action: {}) {
                Label("Reset", systemImage: "arrow.uturn.backward.circle.fill").labelStyle(.iconOnly)
            }.buttonStyle(.plain)
            VStack(alignment: .center, spacing: 0) {
                HStack(alignment: .bottom) {
                    Text("4")
                    Spacer()
                    Text("15").font(
                        .system(size: 80, weight: .semibold))
                }
                Divider()
                HStack(alignment: .top) {
                    Text("2")
                    Spacer()
                    Text("30").font(
                        .system(size: 80, weight: .semibold))
                }
            }
        }
    }
}

struct Match_Previews: PreviewProvider {
    static var previews: some View {
        Match(scoreSetting: "ADV", gameMode: "Sets")
    }
}
