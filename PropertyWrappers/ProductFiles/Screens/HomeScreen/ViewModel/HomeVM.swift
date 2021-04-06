//
//  HomeVM.swift
//  PropertyWrappers
//
//  Created by Harshit Parikh on 06/04/21.
//

import Foundation

class HomeVM: ObservableObject {
    // MARK:- Properties
    @Published var booksArray: [BooksModel]  = []
    
    // MARK:- Methods
    init() {
        self.loadBooksData()
    }
    
    private func loadBooksData() {
        guard let url = Bundle.main.url(forResource: "BooksData", withExtension: "json") else {
            return
        }
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let books = try? decoder.decode([BooksModel].self, from: data)
            self.booksArray = books ?? []
        } catch let error {
            print("Error in reading books data: \(error.localizedDescription)")
        }
    }
}
