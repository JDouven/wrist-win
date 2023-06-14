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
    
    @State private var topScore = 0
    @State private var bottomScore = 0
    
    var body: some View {
        NavigationStack {
            HStack {
                Button(action: {}) {
                    Label("Reset", systemImage: "arrow.uturn.backward.circle.fill").labelStyle(.iconOnly)
                }.buttonStyle(.plain)
                VStack(alignment: .center, spacing: 0) {
                    HStack(alignment: .bottom) {
                        Text("4")
                        Spacer()
                        Text("\(topScore)").font(
                            .system(size: 80, weight: .semibold))
                        .padding(0)
                    }
                    Divider()
                    HStack(alignment: .top) {
                        Text("2")
                        Spacer()
                        Text("\(bottomScore)").font(
                            .system(size: 80, weight: .semibold))
                    }
                }
            }
        }.navigationBarBackButtonHidden(true)
    }
}

struct Match_Previews: PreviewProvider {
    static var previews: some View {
        Match(scoreSetting: "ADV", gameMode: "Sets")
    }
}
