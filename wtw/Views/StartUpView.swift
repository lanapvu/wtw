//
//  ContentView.swift
//  wtw
//
//  Created by Lord Custodio on 11/11/23.
//

import SwiftUI

struct StartUpView: View {
    var body: some View {
        VStack {
                    Spacer()
        Image("Logo") // Replace "your_image_name" with the actual name of your PNG file
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 400, height: 100) // Adjust the size as needed
                    Spacer()
                }
                .background(Color(UIColor(hex: 0xD2EADB))) // Replace with your desired hex color
                .edgesIgnoringSafeArea(.all)
        }
}
extension UIColor {
    convenience init(hex: UInt32, alpha: CGFloat = 1.0) {
        let red = CGFloat((hex & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((hex & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(hex & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}


#Preview {
    StartUpView()
}
