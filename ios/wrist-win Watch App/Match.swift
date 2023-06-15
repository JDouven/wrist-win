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
            .background(.background)
            .edgesIgnoringSafeArea(.bottom)
            .gesture(DragGesture(minimumDistance: 20.0, coordinateSpace: .local)
                .onEnded { value in
                    switch(value.translation.width, value.translation.height) {
                    case (-100...100, ...0):
                        controller.incrementA()
                    case (-100...100, 0...):
                        controller.incrementB()
                    default:  print("no clue")
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
