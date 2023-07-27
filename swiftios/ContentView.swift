//
//  ContentView.swift
//  swiftios
//
//  Created by Duy Pham on 27/07/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(.white).ignoresSafeArea()
            VStack(alignment: .leading, spacing: 14) {
                Image("sea").resizable(capInsets: EdgeInsets())
                        .cornerRadius(16)
                        .aspectRatio(contentMode: .fit).padding(.all)
                HStack {
                    Text("Biển Caribe").font(.title).fontWeight(.semibold)
                    Spacer()
                    Image(systemName: "star")
                    Image(systemName: "star")
                    Image(systemName: "star")
                    Image(systemName: "star")
                    Image(systemName: "star")
                }
               
                Text("Ở đây có rất nhiều cớp biển, List cướp biển nổi tiếng bên dưới: ")
                    .font(.headline)
                TodoListView()
            }.padding(16)
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
