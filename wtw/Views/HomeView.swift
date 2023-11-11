//
//  HomeView.swift
//  wtw
//
//  Created by Lord Custodio on 11/11/23.
//
import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                // Your main content view
                    

                TabView {
                    // Home tab
                   Text("Home")
                        .tabItem {
                            Image(systemName: "house.fill")
                        }
                        .tag(0)
                    //Messages tab
                    Text("Messages")
                        .tabItem {
                            Image(systemName: "chat")
                        }
                    //Add tab
                    Text("Add")
                        .tabItem {
                            Image(systemName: "plus")
                            Text("Add")
                        }
                    // Settings tab
                    Text("Settings")
                        .tabItem {
                            Image(systemName: "gear")
                            Text("Settings")
                        }

                }
                .accentColor(.green) // Set tab icon color
                .padding()
                Color.green
                    .frame(maxHeight: 40)
            }
            }
            .navigationBarTitle("wtw")
            

        }
    }


struct ColorView: View {
    var body: some View {
        Text("")
            .frame(maxWidth: .infinity , maxHeight: 40)
            .background(Color.green)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
