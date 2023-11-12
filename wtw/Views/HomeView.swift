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
            MessagesView()
                .tag(2)
            Text("Tab Content 3")
                .tag(3)
            SearchView()
                .tag(4)
            ProfileView()
                .tag(5)
        }
        .overlay(alignment: .bottom){
            CustomTabView(tabSelection: $tabSelection)
        }
    }
}
struct contentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


