//
//  HomeTabbar.swift
//  InstagramSwiftUI
//
//  Created by Nguyen  on 10/12/2021.
//

import SwiftUI
import Combine

struct HomeTabbar: View {
    @State private var selection = 0
    var body: some View {
        VStack{
            TabView(selection: $selection) {
                HomeView()
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .tag(0)
                Bookmark()
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .tag(1)
                Setting()
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .tag(2)
                Like()
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .tag(3)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            Divider()
            TabBarView(selection: $selection)
        }
    }
}


struct HomeTabbar_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabbar()
    }
}
