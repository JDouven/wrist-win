//
//  Match.swift
//  wrist-win Watch App
//
//  Created by Joris Douven on 14/06/2023.
//

import SwiftUI

struct Match: View {
    let gameSettings: GameSettings
    
    @State private var score = Score()
    
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
                        Text("\(score.scoreA)").font(
                            .system(size: 80, weight: .semibold))
                        .padding(0)
                    }
                    Divider()
                    HStack(alignment: .top) {
                        Text("2")
                        Spacer()
                        Text("\(score.scoreB)").font(
                            .system(size: 80, weight: .semibold))
                    }
                }
            }
        }.navigationBarBackButtonHidden(true)
    }
}

struct Match_Previews: PreviewProvider {
    static var previews: some View {
        Match(gameSettings: GameSettings(scoreType: .goldenPoint, gameMode: .unlimited))
    }
}
