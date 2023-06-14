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

class Score: ObservableObject, NSCopying {
    @Published var a = 0
    @Published var b = 0
    @Published var gamesA = 0
    @Published var gamesB = 0
    
    init() {}
    
    init?(a: Int, b: Int, gamesA: Int, gamesB: Int) {
        guard a == 0 || a == 15 || a == 30 || a == 40 || a == 60 else {
            return nil
        }
        guard b == 0 || b == 15 || b == 30 || b == 40 || b == 60 else {
            return nil
        }
        self.a = a
        self.b = b
        self.gamesA = gamesA
        self.gamesB = gamesB
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        let copy = Score(a: a, b: b, gamesA: gamesA, gamesB: gamesB)
        return copy as Any
    }
}

class ScoreController: ObservableObject {
    let gameSettings: GameSettings
    var scoreHistory: [Score] = []
    
    @Published var score = Score()
    
    init(gameSettings: GameSettings) {
        self.gameSettings = gameSettings
    }
    
    func incrementA() -> Void {
        scoreHistory.append(score.copy() as! Score)
        switch(score.a) {
        case 0:
            score.a = 15
        case 15:
            score.a = 30
        case 30:
            score.a = 40
        case 40:
            if(gameSettings.scoreType == .advantage) {
                score.a = 60
            } else {
                gameWonByA()
            }
        case 60:
            gameWonByA()
        default:
            score.a = 0
        }
    }
    
    func incrementB() -> Void {
        scoreHistory.append(score)
        switch(score.b) {
        case 0:
            score.b = 15
        case 15:
            score.b = 30
        case 30:
            score.b = 40
        case 40:
            if(gameSettings.scoreType == .advantage) {
                score.b = 60
            } else {
                gameWonByB()
            }
        case 60:
            gameWonByB()
        default:
            score.b = 0
        }
    }
    
    func undo() -> Void {
        guard let lastScore = scoreHistory.last else {
            return
        }
        self.score = lastScore
        scoreHistory.removeLast()
    }
    
    private func gameWonByA() -> Void {
        score.a = 0
        score.b = 0
        score.gamesA += 1
    }
    
    private func gameWonByB() -> Void {
        score.a = 0
        score.b = 0
        score.gamesB += 1
    }
}
