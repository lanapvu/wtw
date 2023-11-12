//
//  MainView.swift
//  wtw
//
//  Created by lordpoo on 11/12/23.
//

import SwiftUI
struct Post: Identifiable {
    let id = UUID()
    let category: String
    let username: String
    let profilePictureName: String
    let timePosted: String
    let message: String
    let distance: String
    let priceCategory: String
}

struct MainView: View {
    // Sample posts data
    let posts: [Post] = [
        Post(category: "Hiking", username: "Lord", profilePictureName: "profile1", timePosted: "10 mins ago", message: "Hey guys! I'm going to mount sugarloaf soon on the B40 bus line. I'm leaving in 20 mins. Lmk if you want to come!", distance: "0.3 mi", priceCategory: "$"),
        Post(category: "Food", username: "Hanabel", profilePictureName: "profile1", timePosted: "20", message: "Frank is my favorite dining hall, who's up for some frank dinner tn!", distance: "0.3 mi", priceCategory: "$"),
        Post(category: "Movies", username: "Lana", profilePictureName: "profile2", timePosted: "20", message: "Barbie movie just came out! Does anyone wanna go watch it?", distance: "1 mi", priceCategory: "$"),
        // Add more Post instances here...
    ]
    
    var body: some View {
        NavigationView {
            List(posts) { post in
                PostRow(post: post)
            }
            .navigationTitle("wtw")
            .toolbar {
                // Add the plus button here
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {}) {
                        Image(systemName: "plus")
                    }
                }
                // Add other toolbar items if needed
            }
        }
        .tabItem {
            Image(systemName: "house.fill")
            Text("Home")
        }
    }
}

struct PostRow: View {
    var post: Post
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Text(post.category)
                    .font(.headline)
                    .padding(.bottom, 1)
                Text(post.message)
                    .font(.subheadline)
                HStack {
                    Text(post.username)
                        .font(.caption)
                    Spacer()
                    Text(post.timePosted)
                        .font(.caption)
                }
            }
            Spacer()
            Image(post.profilePictureName) // Use the actual image resource
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
        }
    }
}

// Implement a preview for SwiftUI canvas
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

#Preview {
    MainView()
}
