//
//  GameMode.swift
//  wrist-win Watch App
//
//  Created by Joris Douven on 14/06/2023.
//

import SwiftUI

struct GameMode: View {
    var scoreType: ScoreTypes
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink(destination: Match(gameSettings: GameSettings(scoreType: scoreType, gameMode: .sets))) {
                    Label("Sets", systemImage: "trophy.fill")
                        .padding(.vertical, 6)
                }.buttonBorderShape(.roundedRectangle)
                NavigationLink(destination: Match(gameSettings: GameSettings(scoreType: scoreType, gameMode: .unlimited))) {
                    Label("Unlimited games", systemImage: "infinity")
                        .padding(.vertical, 6)
                }.buttonBorderShape(.roundedRectangle)
            }
        }
    }
}

struct GameMode_Previews: PreviewProvider {
    static var previews: some View {
        GameMode(scoreType: .goldenPoint)
    }
}
