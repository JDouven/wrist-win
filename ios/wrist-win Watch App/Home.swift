//
//  ContentView.swift
//  wrist-win Watch App
//
//  Created by Joris Douven on 14/06/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("logo")
                NavigationLink(destination: ScoreSetting()) {
                    Text("New match")
                        .foregroundColor(.black)
                        .bold()
                }
                .padding()
                .buttonStyle(.borderedProminent)
                .accentColor(.green)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
