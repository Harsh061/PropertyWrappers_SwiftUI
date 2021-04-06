//
//  HomeView.swift
//  PropertyWrappers
//
//  Created by Harshit Parikh on 06/04/21.
//

import SwiftUI

struct HomeView: View {
    // MARK:- Properties
    @StateObject private var viewModel = HomeVM()
    @State private var itemsInCart: Int = 0
    
    var cartView : some View {
        Button(action: {
            
        }) {
            VStack(spacing: -5) {
                if itemsInCart > 0 {
                    Text("\(itemsInCart)")
                        .font(.title3)
                        .foregroundColor(.black)
                }
                
                Image(systemName: itemsInCart > 0 ? "cart.fill" : "cart")
                    .resizable()
                    .frame(width: 22, height: 22)
                    .foregroundColor(.black)
            }
            .padding(2)
        }
        .frame(height: 44)
    }
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                VStack {
                    ForEach(0..<viewModel.booksArray.count, id: \.self) { i in
                        BooksCardView(itemsInCart: $itemsInCart, model: viewModel.booksArray[i])
                    }
                }
                .padding(.horizontal, 15)
            }
            
            .navigationBarItems(trailing: cartView)
            .navigationBarTitle(Text("Books"), displayMode: .large)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
