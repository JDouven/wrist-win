//
//  GameMode.swift
//  wrist-win Watch App
//
//  Created by Joris Douven on 14/06/2023.
//

import SwiftUI

struct GameMode: View {
    let scoreSetting: String
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink(destination: Match(scoreSetting: "GP", gameMode: "Sets")) {
                    Label("Sets", systemImage: "trophy.fill")
                }
                NavigationLink(destination: Match(scoreSetting: "ADV", gameMode: "Inf")) {
                    Label("Unlimited games", systemImage: "infinity")
                }
            }
        }
    }
}

struct GameMode_Previews: PreviewProvider {
    static var previews: some View {
        GameMode(scoreSetting: "ADV")
    }
}
