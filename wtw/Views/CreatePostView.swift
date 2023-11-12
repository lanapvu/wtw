//
//  CreatePostView.swift
//  wtw
//
//  Created by lordpoo on 11/12/23.
//
import SwiftUI

struct CreatePostView: View {
    @State private var location: String = ""
    @State private var fromDate = Date()
    @State private var toDate = Date()
    @State private var selectedCategories: [String] = []
    
    let categories = ["Hiking", "Movie", "Food", "Active", "Tech", "Shows", "Sport", "Inside"]
    let buttonWidth = (UIScreen.main.bounds.width - (5*10))/4
    var body: some View {
        VStack {
            Text("What's the Word?")
                .font(.title)
                .padding()
            
            Image("profile") // Replace with your image name
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .overlay(Circle().stroke(.green, lineWidth:2))
                .padding()
            
            TextField("Location", text: $location)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            

                DatePicker("From", selection: $fromDate, displayedComponents: [.date, .hourAndMinute])
                DatePicker("To", selection: $toDate, displayedComponents: [.date, .hourAndMinute])
                   
            Text("Category")
                .font(.headline)
                .padding()
            
            let columns = Array(repeating: GridItem(.flexible(), spacing: 10), count: 4)
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(categories, id: \.self) { category in
                    Button(action: {
                        if selectedCategories.contains(category) {
                            selectedCategories.removeAll { $0 == category }
                        } else {
                            selectedCategories.append(category)
                        }
                    }) {
                        Text(category)
                            .foregroundColor(selectedCategories.contains(category) ? .white : .black)
                            .padding()
                            .frame(width:buttonWidth, height: 40)
                            .background(selectedCategories.contains(category) ? Color.green : Color.gray)
                            .cornerRadius(10)
                    }
                }
            }
            .padding()
            
            Button("Create Post") {
                // Handle the create post action
            }
            .buttonStyle(FilledRoundedButtonStyle())
            
            Spacer()
        }
        .padding()
    }
}

struct FilledRoundedButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.green)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
    }
}

// Replace "profilePicture" with your actual image resource name or handling mechanism.

#Preview {
    CreatePostView()
}
