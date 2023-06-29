//
//  Match.swift
//  wrist-win Watch App
//
//  Created by Joris Douven on 14/06/2023.
//

import SwiftUI

struct Match: View {
    init(gameSettings: GameSettings) {
        self.controller = ScoreController(gameSettings: gameSettings)
    }
    
    @State var isActive = false
    @ObservedObject private var controller: ScoreController
    
    var body: some View {
        NavigationStack {
            HStack {
                Button(action: {
                    controller.undo()
                }) {
                    Label("Reset", systemImage: "arrow.uturn.backward.circle.fill")
                        .labelStyle(.iconOnly)
                }.buttonStyle(.plain).padding(.trailing, 3.0)
                ScoreBoard(score: controller.score)
            }
        }.navigationBarBackButtonHidden(true)
            .edgesIgnoringSafeArea(.bottom)
            .contentShape(Rectangle())
            .gesture(DragGesture(minimumDistance: 20, coordinateSpace: .global)
                .onEnded { value in
                    let horizontalAmount = value.translation.width
                    let verticalAmount = value.translation.height
                    
                    if abs(horizontalAmount) < abs(verticalAmount) {
                        if verticalAmount < 0 {
                            controller.incrementA()
                        } else {
                            controller.incrementB()
                        }
                    }
                }
            )
            .navigationDestination(isPresented: $isActive) {
                MatchOptions()
            }.onLongPressGesture(perform: {
                isActive = true
            })
        
    }
}

struct Match_Previews: PreviewProvider {
    static var previews: some View {
        Match(gameSettings: GameSettings(scoreType: .goldenPoint, gameMode: .unlimited))
    }
}
