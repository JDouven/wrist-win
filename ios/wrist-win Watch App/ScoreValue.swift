//
//  Score.swift
//  wrist-win Watch App
//
//  Created by Joris Douven on 14/06/2023.
//

import SwiftUI

struct ScoreValue: View {
    @Binding var scoreSelf: Int
    @Binding var scoreOther: Int
    
    var showDeuce: Bool {
        return scoreSelf == 40 && scoreOther == 40
    }
    
    var scoreDisplayValue: String {
        if(scoreSelf == 60) {
            return "AD"
        }
        return "\(scoreSelf)"
    }
    
    var body: some View {
        if(showDeuce) {
            Text("Deuce").font(.system(size: 48, weight: .medium))
        } else {
            Text(scoreDisplayValue).font(.system(size: 76, weight: .semibold))
        }
    }
}

struct ScoreValue_Previews: PreviewProvider {
    static var previews: some View {
        ScoreBoard(score: Score(a: 40, b: 40, gamesA: 2, gamesB: 1)!)
    }
}
