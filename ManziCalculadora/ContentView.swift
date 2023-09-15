//
//  ContentView.swift
//  ManziCalculadora
//
//  Created by Christian Manzaraz on 14/09/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            GeometryReader { proxy in
                VStack {
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            Text("0")
                                .foregroundColor(.white)
                                .font(.system(size: 100, weight:  .regular))
                                .frame(height: 100)
                                .padding(.trailing, 20)
                        }
                    }
                    VerticalButtonStack(
                        data: Matrix.firstSectionData,
                        columns: Matrix.firstSectionGrid(proxy.size.width * 0.25),
                        width: proxy.size.width
                    )
                    VerticalButtonStack(
                        data: Matrix.secondSectionData,
                        columns: Matrix.secondSectionGrid(proxy.size.width * 0.25),
                        width: proxy.size.width
                    )
                }
            }
            .background(Color.black)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
