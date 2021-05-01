//
//  ContentView.swift
//  FoodDelivery
//
//  Created by Harshit Parikh on 01/05/21.
//

import SwiftUI



struct ContentView: View {
    var body: some View {
        HomeView(viewModel: HomeVM())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

