//
//  ScoreSetting.swift
//  wrist-win Watch App
//
//  Created by Joris Douven on 14/06/2023.
//

import SwiftUI

struct InvertedLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.title
            configuration.icon
        }
    }
}

struct ScoreSetting: View {
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink(destination: GameMode(scoreType: .goldenPoint)) {
                    Label("Golden point", systemImage: "tennisball.fill").padding(.vertical, 6)
                }.buttonBorderShape(.roundedRectangle)
                NavigationLink(destination: GameMode(scoreType: .advantage)) {
                    Label("Advantage", systemImage: "figure.tennis").labelStyle(InvertedLabelStyle())
                        .padding(.vertical, 6)
                }.buttonBorderShape(.roundedRectangle)
            }
        }
    }
}

struct ScoreSetting_Previews: PreviewProvider {
    static var previews: some View {
        ScoreSetting()
    }
}
