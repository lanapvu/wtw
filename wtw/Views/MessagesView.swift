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
    var body: String
    var dotColor: Color // New property for dot color
    var imageName: String
}

struct MessagesView: View {
    let messages = [
        Message(sender: "Lord", body: "Hey, are you available for a meeting tomorrow at 2 PM?", dotColor: .yellow, imageName: "profile"),
        Message(sender: "Hanabel", body: "I heard frank was the vibe. Wanna go now? I can be there in like 10.", dotColor: .green, imageName: "profile1"),
        Message(sender: "Lana", body: "So what do you like to do for fun?", dotColor: .gray, imageName: "profile1"),
        Message(sender: "Danny", body: "uhhhhh so what now?", dotColor: .gray, imageName: "profile2"),
        
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
        Image(message.imageName) // Replace with an actual image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 65, height: 65)
                    .clipShape(Circle())
                    .padding(.trailing, 0) // Adjust the trailing padding
        HStack(alignment: .top) {

            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(message.sender)
                        .font(.headline)
                    
                    Circle()
                        .fill(message.dotColor)
                        .frame(width: 12, height: 12)
                        .padding(.leading, 5)
                }

                Text(message.body.prefix(30) + "...")
                    .lineLimit(1)
                    .foregroundColor(.gray)
            }
        }
        .padding(20)
    }
}

struct MessageDetail: View {
    var message: Message

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("From: \(message.sender)")
                .font(.headline)
                .foregroundColor(.gray)
            Text(message.body)
                .padding(.top, 20)
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(leading: CustomBackButton())
        }
        .padding(20)
    }
}
struct CustomBackButton: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack(spacing: 1) {
                Image(systemName: "arrow.left.circle.fill")
                    .foregroundColor(Color(UIColor(hex: 0x077D35))) // Change the color to your desired color
                    .font(.title)
                Text("Messages")
                    .foregroundColor(Color(UIColor(hex: 0x4CA46E)))
                    .font(.headline)
            }
        }
    }
}

#Preview {
    MessagesView()
}
