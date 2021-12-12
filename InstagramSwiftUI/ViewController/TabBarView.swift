//
//  TabBarView.swift
//  InstagramSwiftUI
//
//  Created by Nguyen  on 11/12/2021.
//

import SwiftUI

struct TabBarView: View {
    @Binding var selection: Int
    @Namespace private var currentTab
    var body: some View {
        HStack(alignment: .bottom){
            ForEach(tabs.indices){ index in
                GeometryReader{
                    geometry in
                    VStack( spacing: 4){
                        if selection == index {
                            Color(CGColor.init(_colorLiteralRed: 223/225, green: 57/225, blue: 85/225, alpha: 1))
                                .frame(height: 2)
                                .offset(y: -8)
                                .matchedGeometryEffect(id: "currentTab", in: currentTab)
                        }
                        
                        if tabs[selection].lable == "Notifications" && tabs[index].lable == "Notifications"{
                            Image(systemName: tabs[index].image)
                                .frame(height: 20)
                                .rotationEffect(.degrees(25))
                        } else{
                            Image(systemName: tabs[index].image)
                                .frame(height: 20)
                                .rotationEffect(.degrees(0))
                        }
                        
                        Text(tabs[index].lable)
                            .font(.caption2)
                            .fixedSize()
                    }
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(width: geometry.size.width / 2 , height: 44, alignment: .bottom)
                    .padding(.horizontal)
                    .foregroundColor(selection == index ? Color(CGColor.init(_colorLiteralRed: 223/225, green: 57/225, blue: 85/225, alpha: 1)) : .secondary)
                    .onTapGesture {
                        withAnimation {
                            selection = index
                        }
                    }
                }
                .frame( height: 44, alignment: .bottom)
            }
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(selection: Binding.constant(0))
            .previewLayout(.sizeThatFits)
    }
}

struct Tab{
    let image: String
    let lable: String
}

let tabs = [
    Tab(image: "homekit", lable: "Home"),
    Tab(image: "book", lable: "Bookmark"),
    Tab(image: "heart", lable: "Like"),
    Tab(image: "gear", lable: "Setting")
]

