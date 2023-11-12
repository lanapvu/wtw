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
    
    var body: some View {
        ZStack {
            Capsule()
                .frame(height: 80)
                .foregroundColor(Color(.secondarySystemBackground))
                .shadow(radius: 2)
            
            HStack{
                ForEach(0..<5) {index in
                    Button {
                        tabSelection = index + 1
                    } label: {
                        VStack(spacing: 8){
                            Spacer()
                            
                            Image(systemName: tabBarItems[index].image)
                            
                            Text(tabBarItems[index].title)
                            if index + 1 == tabSelection {
                                Capsule()
                                    .frame(height: 8)
                                    .foregroundColor(.black)
                                    .matchedGeometryEffect(id:"SelectedTabId", in: animationNamespace)
                                    .offset(y: 3)
                            } else{
                                Capsule()
                                    .frame(height:8)
                                    .foregroundColor(.clear)
                                    .offset(y: 3)
                            }
                        }
                        .foregroundColor(index + 1 == tabSelection ? .blue : .gray)
                    }
                }
            }
            .frame(height: 80)
            .clipShape(Capsule())
        }
        
        .padding(.horizontal)
    }
}
struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabView(tabSelection: .constant(1))
            .previewLayout(.sizeThatFits)
            .padding(.vertical)
    }
}
