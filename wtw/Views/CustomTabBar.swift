//
//  CustomTabView.swift
//  wtw
//
//  Created by Hanabel Mengistu on 11/11/23.
//
import SwiftUI


struct CustomTabView: View {
    @Binding var tabSelection: Int
    @Namespace private var animationNamespace
    
    let tabBarItems: [(image: String, title: String)] = [
        ("house", ""),
        ("message", ""),
        ("plus", ""),
        ("magnifyingglass", ""),
        ("person.crop.circle", "")
    ]
    
    @State private var selectedImage: String?
    
    var body: some View {
        ZStack {
            Capsule()
                .frame(height: 80)
                .foregroundColor(Color(UIColor(hex: 0x4CA46E)))
                .shadow(radius: 2)
            
            HStack {
                ForEach(0..<tabBarItems.count) { index in
                    Button {
                        handleTabSelection(index)
                    } label: {
                        VStack(spacing: 8) {
                            Spacer()
                            
                            Image(systemName: selectedImage == tabBarItems[index].image ? tabBarItems[index].image + ".fill" : tabBarItems[index].image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 21)
                                .offset(y: 7)
                            
                            Text(tabBarItems[index].title)
                            
                            if tabSelection == index + 1 {
                                Capsule()
                                    .frame(height: 8)
                                    .foregroundColor(.black)
                                    .matchedGeometryEffect(id: "SelectedTabId", in: animationNamespace)
                                    .offset(y: 10)
                            } else {
                                Capsule()
                                    .frame(height: 8)
                                    .foregroundColor(.clear)
                                    .offset(y: 3)
                            }
                        }
                        .foregroundColor(tabSelection == index + 1 ? Color(UIColor(hex: 0x374957)) : Color(UIColor(hex: 0x374957)))
                    }
                }
            }
            .frame(height: 80)
            .clipShape(Capsule())
        }
        .padding(.horizontal)
    }
    
    private func handleTabSelection(_ selectedIndex: Int) {
        if selectedIndex == 3 {
            // Special handling for "magnifyingglass" case
            selectedImage = tabSelection == selectedIndex + 1 ? tabBarItems[selectedIndex].image : tabBarItems[selectedIndex].image + ".fill"
        } else if selectedIndex == 2 {
            // Special handling for "plus" case
            selectedImage = tabSelection == selectedIndex + 1 ? tabBarItems[selectedIndex].image : tabBarItems[selectedIndex].image + ".fill"
        } else {
            selectedImage = tabBarItems[selectedIndex].image
        }
        
        tabSelection = selectedIndex + 1
    }
}

struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabView(tabSelection: .constant(1))
            .previewLayout(.sizeThatFits)
            .padding(.vertical)
    }
}
