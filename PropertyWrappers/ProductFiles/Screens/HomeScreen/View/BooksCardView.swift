//
//  BooksCardView.swift
//  PropertyWrappers
//
//  Created by Harshit Parikh on 06/04/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct BooksCardView: View {
    // MARK:- Properties
    @State private var isToogleEnabled: Bool = false
    @Binding var itemsInCart: Int
    @State private var canNavigateToDetailView: Bool = false
    
    var model: BooksModel
    
    var body: some View {
        if canNavigateToDetailView {
            NavigationLink(destination: DetailView(viewModel: DetailVM(model: model)), isActive: $canNavigateToDetailView) {
                EmptyView()
            }
        }
        
        HStack(spacing: 10) {
            WebImage(url: URL(string: model.thumbnail))
                .renderingMode(.original)
                .resizable()
                .indicator(.activity)
                .frame(width: 80, height: 120)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(model.title)
                    .font(.headline)
                Text(model.authors.joined(separator: ", "))
                    .font(.caption)
                Text(model.shortDescription)
                    .font(.subheadline)
                    .lineLimit(2)
                
                HStack {
                    Toggle("Add to Cart", isOn: self.$isToogleEnabled.didSet(execute: { (value) in
                        if value {
                            itemsInCart += 1
                        } else {
                            itemsInCart -= 1
                        }
                    }))
                    .toggleStyle(SwitchToggleStyle(tint: .green))
                    .frame(width: 160)
                    
                    Spacer()
                }
            }
            .padding(.vertical, 5)
        }
        .padding(8)
        .overlay(
            RoundedRectangle(cornerRadius: 5)
                .stroke(Color.black, lineWidth: 0.25)
        )
        .cornerRadius(5)
        .onTapGesture {
            self.canNavigateToDetailView = true
        }
    }
}

struct BooksCardView_Previews: PreviewProvider {
    @State static var value = 0
    
    static var previews: some View {
        BooksCardView(itemsInCart: $value, model: BooksModel(title: "Coffeehouse", thumbnail: "https://s3.amazonaws.com/AKIAJC5RLADLUMVRPFDQ.book-thumb-images/asher.jpg", shortDescription: "Coffeehouse is an anthology of stories, poems and essays originally published on the World Wide Web.", longDescription: "Coffeehouse is an anthology of stories, poems and essays originally published on the World Wide Web. The purpose is to capture the zeitgeist of the web's creative community, and to give readers a chance to enjoy some of the best and most notable original works that have appeared in this form. It showcases over forty individual web writers, among them Joseph Squier, Martha Conway, Jason Snell, David Alexander, Carl Steadman and Walter Miller. The intent is to show the variety and vitality of the web's blossoming literary \"scene,\" and to capture the unique and highly iconoclastic \"personality\" of the web community.", authors: ["Levi Asher", "Christian Crumlish"]))
    }
}
