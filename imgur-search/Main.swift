//
//  Main.swift
//  imgur-search
//
//  Created by Bruno Vieira on 05/09/21.
//

import SwiftUI

struct Main: View {
    var body: some View {
        NavigationView{
            HomeView()
                .navigationTitle("Imgur Search")
        }
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main()
    }
}
