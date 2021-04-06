//
//  DetailView.swift
//  PropertyWrappers
//
//  Created by Harshit Parikh on 06/04/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct DetailView: View {
    // MARK:- Properties
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: DetailVM
    
    var btnBack : some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image(systemName: "chevron.backward")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.black)
                    .frame(width: 22, height: 22)
            }
        }
    }
    
    var body: some View {
        List {
            HStack {
                Spacer()
                WebImage(url: URL(string: viewModel.booksModel.thumbnail))
                    .renderingMode(.original)
                    .resizable()
                    .indicator(.activity)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250, height: 300)
                Spacer()
            }
            
            Section(header: Text("Authors")) {
                Text(viewModel.booksModel.authors.joined(separator: ", "))
            }
            
            Section(header: Text("Short Description")) {
                Text(viewModel.booksModel.shortDescription)
            }
            
            Section(header: Text("Long Description")) {
                Text(viewModel.booksModel.longDescription)
            }
        }
        
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: btnBack)
        .navigationBarTitle(Text(viewModel.booksModel.title), displayMode: .inline)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(viewModel: DetailVM(model: BooksModel(title: "Coffeehouse", thumbnail: "https://s3.amazonaws.com/AKIAJC5RLADLUMVRPFDQ.book-thumb-images/asher.jpg", shortDescription: "Coffeehouse is an anthology of stories, poems and essays originally published on the World Wide Web.", longDescription: "Coffeehouse is an anthology of stories, poems and essays originally published on the World Wide Web. The purpose is to capture the zeitgeist of the web's creative community, and to give readers a chance to enjoy some of the best and most notable original works that have appeared in this form. It showcases over forty individual web writers, among them Joseph Squier, Martha Conway, Jason Snell, David Alexander, Carl Steadman and Walter Miller. The intent is to show the variety and vitality of the web's blossoming literary \"scene,\" and to capture the unique and highly iconoclastic \"personality\" of the web community.", authors: ["Levi Asher", "Christian Crumlish"])))
    }
}
