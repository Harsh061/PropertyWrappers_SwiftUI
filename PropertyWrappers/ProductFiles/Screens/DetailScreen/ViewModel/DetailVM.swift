//
//  DetailVM.swift
//  PropertyWrappers
//
//  Created by Harshit Parikh on 06/04/21.
//

import Foundation

class DetailVM: ObservableObject {
    // MARK:- Properties
    @Published var booksModel: BooksModel
    
    // MARK:- Methods
    init(model: BooksModel) {
        self.booksModel = model
    }
    
}
