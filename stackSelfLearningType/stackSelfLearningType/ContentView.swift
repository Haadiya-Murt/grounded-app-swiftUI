//
//  ContentView.swift
//  stackSelfLearningType
//
//  Created by Student on 2026-02-24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        let name="Haadiya"
        var age=16
        
        ZStack {
            Color.indigo
                .ignoresSafeArea()
            
            ZStack {
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.mint)
                    .frame(width: 350, height:280)
                
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color.white)
                    .frame(width: 350, height:65)
                    .offset(x:0, y:-110)
            }
            
            Text("Account Details")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.indigo)
                    .offset(x:0, y: -107)
            
            VStack (alignment: .leading, spacing: 10) {
                Text("Name: " + name)
                    .font(.title)
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                
                var yOB = 2026 - age
                Text("Year of birth: " + String(yOB))
                    .font(.title)
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                
                Text("Hikey not my birthyear. 2009 supremacy??")
                    .foregroundColor(.white)

            }

        }
        
    }
}

#Preview {
    ContentView()
}
