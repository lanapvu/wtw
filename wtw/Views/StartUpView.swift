import SwiftUI

struct StartUpView: View {
    @State private var isActive = false

    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Image("Logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 400, height: 100)
                Spacer()
            }
            .background(Color(UIColor(hex: 0xD2EADB)))
            .edgesIgnoringSafeArea(.all)
            .onAppear {
                // Add a 3-second delay
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    isActive = true
                }
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true) // Hide the back button
            .overlay(
                // Use a NavigationLink to switch to a different view after the delay
                NavigationLink(
                    destination: ContentView()
                        .navigationBarHidden(true), // Hide the navigation bar in the destination view
                    isActive: $isActive,
                    label: { EmptyView() }
                )
            )
        }
    }
}

public extension UIColor {
    convenience init(hex: UInt32, alpha: CGFloat = 1.0) {
        let red = CGFloat((hex & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((hex & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(hex & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}


struct StartUpView_Previews: PreviewProvider {
    static var previews: some View {
        StartUpView()
    }
}
