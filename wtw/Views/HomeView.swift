
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
        TabView(selection: $tabSelection) {
            Text("Tab Content 1")
                .tag(1)
            Text("Tab Content 2")
                .tag(2)
            Text("Tab Content 3")
                .tag(3)
            Text("Tab Content 4")
                .tag(4)
            Text("Tab Content 5")
                .tag(5)
        }
        .overlay(alignment: .bottom){
            CustomTabView(tabSelection: $tabSelection)
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
