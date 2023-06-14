//
//  MatchOptions.swift
//  wrist-win Watch App
//
//  Created by Joris Douven on 14/06/2023.
//

import SwiftUI

struct MatchOptions: View {
    var body: some View {
        VStack(){
            Text("MatchOptions")
            Button(action: {
                //end match
            }) {
                Label("End match", systemImage: "stop.circle")
            }.buttonStyle(.bordered).tint(.red)
        }
        
        
    }
}

struct MatchOptions_Previews: PreviewProvider {
    static var previews: some View {
        MatchOptions()
    }
}
