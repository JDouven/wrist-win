//
//  Match.swift
//  wrist-win Watch App
//
//  Created by Joris Douven on 14/06/2023.
//

import SwiftUI

struct Match: View {
    init(gameSettings: GameSettings) {
        self.score = ScoreController(gameSettings: gameSettings)
    }
    
    @State var isActive = false
    @State private var score: ScoreController
    
    var body: some View {
        NavigationStack {
          
            HStack {
                Button(action: {
                    //undo
                }) {
                    Label("Reset", systemImage: "arrow.uturn.backward.circle.fill").labelStyle(.iconOnly)
                }.buttonStyle(.plain).padding(.trailing, 3.0)
                VStack(alignment: .center, spacing: 0) {
                    HStack(alignment: .bottom) {
                        Text("4").font(.system(size: 20, weight: .semibold))
                            .padding(.bottom, 2.0)
                        Spacer()
                        Text("\(score.scoreA)").font(
                            .system(size: 76, weight: .semibold))
                        .padding(.vertical, -8)
                    }
                    Divider().frame(height: 2).overlay(Color.accentColor)
                    HStack(alignment: .top) {
                        Text("2").font(.system(size: 20, weight: .semibold))
                            .padding(.top, 2.0)
                        Spacer()
                        Text("\(score.scoreB)").font(
                            .system(size: 76, weight: .semibold))
                        .padding(.vertical, -8)
                    }
                }
            
                
            }.navigationDestination(isPresented: $isActive) {
                MatchOptions()
            }.onLongPressGesture(perform: {
                isActive = true
            })
            
        }.navigationBarBackButtonHidden(true)
            .contentShape(Rectangle())
            .gesture(DragGesture(minimumDistance: 3.0, coordinateSpace: .local)
                .onEnded { value in
                    switch(value.translation.width, value.translation.height) {
                        case (-100...100, ...0):  print("up swipe")
                        case (-100...100, 0...):  print("down swipe")
                        default:  print("no clue")
                    }
                }
            )
    }
}

struct Match_Previews: PreviewProvider {
    static var previews: some View {
        Match(gameSettings: GameSettings(scoreType: .goldenPoint, gameMode: .unlimited))
    }
}
