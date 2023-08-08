//
//  Movie.swift
//  FilmFest
//
//  Created by David Okonkwo on 08/08/2023.
//  Copyright © 2023 Author. All rights reserved.
//

import Foundation

struct Movie: Equatable {
    let title: String
    let releaseDate: String?
    
    init(title: String, releaseDate: String? = nil) {
        self.title = title
        self.releaseDate = releaseDate
    }
}

func ==(lhs: Movie, rhs: Movie) -> Bool {
    if lhs.title != rhs.title || lhs.releaseDate != rhs.releaseDate {
        return false
    }
        
    return true
}
