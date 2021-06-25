//
//  ContentView.swift
//  NewsProject
//
//  Created by Naomi Ortiz González on 6/22/21.
//  Copyright © 2021 Naomi Ortiz Gonzalez. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            TopNews().tabItem{
                Image(systemName: "list.bullet")
                Text("News")
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
