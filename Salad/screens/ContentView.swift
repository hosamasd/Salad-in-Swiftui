 //
//  ContentView.swift
//  Salad
//
//  Created by hosam on 11/17/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabBar()
            .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
