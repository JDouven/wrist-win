//
//  ContentView.swift
//  wrist-win Watch App
//
//  Created by Joris Douven on 14/06/2023.
//

import SwiftUI

struct Home: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 9.0) {
                Image("padel-logo-w")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Spacer()
                NavigationLink(destination: ScoreSetting()) {
                    Text("New match")
                        .foregroundColor(.black)
                        .padding(.vertical, 4)
                        .font(.system(size: 18, weight: .semibold))
                }
                .padding(0)
                .buttonStyle(.borderedProminent)
                .accentColor(.accentColor)
            }
        }
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
