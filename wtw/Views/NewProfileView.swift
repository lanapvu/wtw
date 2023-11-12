//
//  NewProfile.swift
//  wtw
//
//  Created by Lord Custodio on 11/11/23.
//

import SwiftUI

struct NewProfileView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("wtw")
                    .font(.system(size: 40))
                    .padding(.top, 0) // Move the text lower
                    .padding(.leading, 40) // Move the text to the right
                Spacer()
                Image(systemName: "gear")
                    .font(.title)
                    .padding()
            }
            CircleImage()
                .offset(CGSize(width: 10.0, height: 10.0))
            Spacer()
            Interests()
                .offset(CGSize(width: 10.0, height: 10.0))
            Spacer()
        }
        
    }
}

struct CircleImage: View{
    var body: some View {
        Image("profile")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 400, height: 100)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .overlay(Circle().stroke(.gray, lineWidth:4))
        Text("Lord Custodio")
            .font(.system(size: 20))
            .padding(.leading, 130)
        Text("he/him")
            .padding(.leading, 163)
        HStack {
            Image(systemName: "location")
                .font(.title)
            
            Text("Amherst, MA")
                .font(.system(size: 18))
        }
        .padding(.leading, 110)
    }
}

struct Interests:View{
    var body: some View{
        Text("Interests")
            .font(.title)
            .padding()
        HStack {
        InterestBubble(text: "Movies")
        InterestBubble(text: "Hiking")
        InterestBubble(text: "Concerts")
        InterestBubble(text: "Dinner")
        }
        Spacer()
        
    }
}
struct InterestBubble: View {
    var text: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.green)
                .frame(width: 80, height: 40)
            Text(text)
                .foregroundColor(.white)
                .padding()
        }
    }
}

#Preview {
    NewProfileView()
}


