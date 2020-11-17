//
//  TabBar.swift
//  Salad
//
//  Created by hosam on 11/17/20.
//

import SwiftUI

struct TabBar: View {
    @State var currentTab = "house"
    @Namespace var animation
    
    init() {
        
        // hiding default tab bar....
        UITabBar.appearance().isHidden = true
    }
    // safe area values...
    @State var safeArea = UIApplication.shared.windows.first?.safeAreaInsets
  
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            
            TabView(selection: $currentTab){
                
                Home(animation: animation)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .tag(tabs[0])
                    .background(Color("bg").ignoresSafeArea())
                
                Text("Booking")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .tag(tabs[1])
                    .background(Color("bg").ignoresSafeArea())
                
                Text("Favourites")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .tag(tabs[2])
                    .background(Color("bg").ignoresSafeArea())
                
                Text("Settings")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .tag(tabs[3])
                    .background(Color("bg").ignoresSafeArea())
            }
            
            HStack {
                ForEach(tabs,id:\.self) {image in
                    TabButton(image: image, selected: $currentTab, animation: animation)
                    
//                    if image != tabs.last{Spacer(minLength: 0)}
                }
            }
            .padding(.horizontal,35)
            .padding(.top)
            .padding(.bottom,safeArea?.bottom != 0 ? safeArea?.bottom : 15)
            .background(
            
                LinearGradient(gradient: .init(colors: [Color("g1"),Color("g2")]), startPoint: .top, endPoint: .bottom)
                    .clipShape(CustomCorner(corners: [.topLeft,.topRight]))
            )
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}

var tabs = ["house","book","suit.heart","person"]
