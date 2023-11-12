
//
//  HomeView.swift
//  wtw
//
//  Created by Lord Custodio on 11/11/23.
//
import SwiftUI
struct ContentView: View {
    @State private var tabSelection = 1
    
    var body: some View {
        NavigationView {
                TabView {
                    // Home tab
                   Text("Home")
                        .tabItem {
                            Image(systemName: "house.fill")
                            Text("Home")
                        }
                        .tag(0)
                    //Messages tab
                    MessagesView()
                   .tabItem {
                       Image(systemName: "message.fill")
                       Text("Messages")
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
                .tint(.white) // <- change the color of each tab icon
                .onAppear {
                    let tabBarAppearance = UITabBarAppearance()
                    tabBarAppearance.backgroundColor = .red
                    UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
                    
                }
            }
            .navigationBarTitle("wtw")
            

        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
