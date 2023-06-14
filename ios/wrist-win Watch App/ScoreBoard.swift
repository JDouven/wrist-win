//
//  ScoreBoard.swift
//  wrist-win Watch App
//
//  Created by Joris Douven on 14/06/2023.
//

import SwiftUI

struct ScoreBoard: View {
    @ObservedObject var score: Score
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            HStack(alignment: .bottom) {
                Text("\(score.gamesA)").font(.system(size: 20, weight: .semibold))
                    .padding(.bottom, 2.0)
                Spacer()
                Text("\(score.a)").font(
                    .system(size: 76, weight: .semibold))
                .padding(.vertical, -6)
            }
            Divider().frame(height: 2).overlay(Color.accentColor)
            HStack(alignment: .top) {
                Text("\(score.gamesB)").font(.system(size: 20, weight: .semibold))
                    .padding(.top, 2.0)
                Spacer()
                Text("\(score.b)").font(
                    .system(size: 76, weight: .semibold))
                .padding(.vertical, -8)
            }
        }
    }
}

struct ScoreBoard_Previews: PreviewProvider {
    static var previews: some View {
        ScoreBoard(score: Score())
    }
}
