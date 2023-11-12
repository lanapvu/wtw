//
//  MessagesView.swift
//  wtw
//
//  Created by Lord Custodio on 11/11/23.
//

import SwiftUI

struct Message: Identifiable {
    var id = UUID()
    var sender: String
    var subject: String
    var body: String
    var dotColor: Color // New property for dot color
}

struct MessagesView: View {
    let messages = [
        Message(sender: "John Doe", subject: "Meeting Tomorrow", body: "Hey, are you available for a meeting tomorrow at 2 PM?", dotColor: .blue),
        Message(sender: "Jane Smith", subject: "Project Update", body: "Here's the latest update on the project. Please review.", dotColor: .green),
        // Add more messages as needed
    ]

    var body: some View {
        NavigationView {
            List(messages) { message in
                NavigationLink(destination: MessageDetail(message: message)) {
                    MessageRow(message: message)
                }
            }
            .navigationBarTitle("Messages", displayMode: .large)
        }
        .background(Color.white)
    }
}

struct MessageRow: View {
    var message: Message

    var body: some View {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(message.sender)
                        .font(.headline)
                    Text(message.body.prefix(30) + "...")
                        .lineLimit(1) // Limit the number of lines for better display
                        .foregroundColor(.gray)
                }
                .alignmentGuide(.leading, computeValue: { dimension in
                    dimension[.trailing]
                })
                Circle()
                    .fill(message.dotColor)
                    .frame(width: 10, height: 10)
                    .padding(.trailing, 10)
            }
            .padding(10)
    }
}
struct MessageDetail: View {
    var message: Message

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("From: \(message.sender)")
                .font(.headline)
            Text("Subject: \(message.subject)")
                .foregroundColor(.gray)
            Text(message.body)
                .padding(.top, 20)
        }
        .padding(20)
        .navigationBarTitle(message.subject)
    }
}


#Preview {
    MessagesView()
}
