//
//  NewProfile.swift
//  wtw
//
//  Created by Lord Custodio on 11/11/23.
//
import SwiftUI
struct ProfileView: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                HStack {
                    Text("wtw")
                        .font(.system(size: 40))
                        .padding(.leading, 40)
                    Spacer()
                    NavigationLink("Log out", destination: LoginView())
                        .foregroundColor(.green)
                        .padding()
                }
                CircleImage()
                Spacer()
                Interests()
                Spacer()
            }
            .navigationBarHidden(true)
            .padding()
        }
    }
}
struct CircleImage: View{
    var body: some View {
        Image("profile")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.gray, lineWidth: 4))
                    .padding(.leading, 140)
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
    ProfileView()
}
