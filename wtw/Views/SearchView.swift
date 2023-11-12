//
//  SearchView.swift
//  wtw
//
//  Created by Hanabel Mengistu on 11/11/23.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    @State private var isSearching = false
    @State private var searchHistory: [String] = []

    let allItems = ["Frank", "Barbie", "Student Union", "Breakfast"]

    var filteredItems: [String] {
        if searchText.isEmpty {
            return allItems
        } else {
            return allItems.filter { $0.localizedCaseInsensitiveContains(searchText) }
        }
    }

    var body: some View {
        
        NavigationView {
            VStack {
                SearchBar(searchText: $searchText, isSearching: $isSearching, onCommit: {
                    addToSearchHistory(searchText)
                })

                List(filteredItems, id: \.self) { item in
                    Text(item)
                }
            }
            .navigationTitle("Search")
        }
        
        .onAppear {
            loadSearchHistory()
        }
        
    }

    private func addToSearchHistory(_ query: String) {
        if !query.isEmpty && !searchHistory.contains(query) {
            searchHistory.insert(query, at: 0)
            saveSearchHistory()
        }
    }

    private func loadSearchHistory() {
        if let savedSearchHistory = UserDefaults.standard.stringArray(forKey: "SearchHistory") {
            searchHistory = savedSearchHistory
        }
    }

    private func saveSearchHistory() {
        UserDefaults.standard.set(searchHistory, forKey: "SearchHistory")
    }
}

struct SearchBar: View {
    @Binding var searchText: String
    @Binding var isSearching: Bool
    var onCommit: () -> Void

    var body: some View {
        HStack {
            TextField("Search", text: $searchText, onCommit: onCommit)
                .padding(8)
                .background(Color(.systemGray5))
                .cornerRadius(8)
                .padding(.horizontal, 10)
                .onTapGesture {
                    isSearching = true
                }

            if isSearching {
                Button(action: {
                    searchText = ""
                    isSearching = false
                }) {
                    Text("Cancel")
                }
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
                .animation(.default)
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
