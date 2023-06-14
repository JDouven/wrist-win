//
//  Logic.swift
//  wrist-win Watch App
//
//  Created by Joris Douven on 14/06/2023.
//

import Foundation

enum ScoreTypes {
    case goldenPoint
    case advantage
}

enum GameModes {
    case sets
    case unlimited
}

struct GameSettings {
    var scoreType: ScoreTypes?
    var gameMode: GameModes?
}

class ScoreController {
    let gameSettings: GameSettings
    @Published var gamesWonA = 0
    @Published var gamesWonB = 0
    @Published var scoreA = 0
    @Published var scoreB = 0
    
    init(gameSettings: GameSettings) {
        self.gameSettings = gameSettings
    }
    
    func incrementA() -> Void {
        switch(scoreA) {
        case 0:
            scoreA = 15
        case 15:
            scoreA = 30
        case 30:
            scoreA = 40
        case 40:
            scoreA = 60
        default:
            scoreA = 0
        }
    }
    
    func incrementB() -> Void {
        switch(scoreB) {
        case 0:
            scoreB = 15
        case 15:
            scoreB = 30
        case 30:
            scoreB = 40
        case 40:
            scoreB = 60
        default:
            scoreB = 0
        }
    }
}
