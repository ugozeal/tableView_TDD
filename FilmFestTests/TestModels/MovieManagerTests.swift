//
//  MovieManagerTests.swift
//  FilmFestTests
//
//  Created by David Okonkwo on 08/08/2023.
//  Copyright © 2023 Author. All rights reserved.
//

import XCTest
@testable import FilmFest

final class MovieManagerTests: XCTestCase {
    var sut: MovieManager!
    let sciFiMovie = Movie(title: "Sci-Fi")
    let actionMovie = Movie(title: "Action/Adventure")
    let arthouseMovie = Movie(title: "Arthouse Drama")

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = MovieManager()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // MARK: Initial Values
    func testInit_MoviesToSee_ReturnsZero() {
        XCTAssertEqual(sut.moviesToSeeCount, 0)
    }
    

    func testInit_MoviesSeen_ReturnsZero() {
        XCTAssertEqual(sut.moviesSeenCount, 0)
    }
    
    // MARK: Add & Query
    
    func testAdd_MoviesToSee_ReturnsOne() {
        sut.addMovie(movie: sciFiMovie)
        
        XCTAssertEqual(sut.moviesToSeeCount, 1)
    }
    
    func testQuery_ReturnsMovieAtIndex() {
        sut.addMovie(movie: arthouseMovie)
        
        let movieQueried = sut.movieAtIndex(index: 0)
        XCTAssertEqual(arthouseMovie.title, movieQueried.title)
    }
    
    // MARK: Checking off
    func testCheckOffMovie_UpdatesMovieManagerCounts() {
        sut.addMovie(movie: actionMovie)
        sut.checkOffMovieAtIndex(index: 0)
        
        XCTAssertEqual(sut.moviesToSeeCount, 0)
        XCTAssertEqual(sut.moviesSeenCount, 1)
    }
    
    func testCheckOffMovie_RemovesMovieFromArray() {
        sut.addMovie(movie: sciFiMovie)
        sut.addMovie(movie: arthouseMovie)
        sut.addMovie(movie: actionMovie)
        sut.checkOffMovieAtIndex(index: 0)
        
        XCTAssertEqual(sut.movieAtIndex(index: 0).title, arthouseMovie.title)
    }
    
    func testCheckOffMovie_ReturnsMovieAtIndex() {
        sut.addMovie(movie: sciFiMovie)
        sut.checkOffMovieAtIndex(index: 0)
        
        let movieQueried = sut.checkedOffMovieAtIndex(index: 0)
        XCTAssertEqual(sciFiMovie.title, movieQueried.title)
    }
    
    func testClearArrays_ReturnsArrayCountsOfZero() {
        sut.addMovie(movie: sciFiMovie)
        sut.addMovie(movie: actionMovie)
        
        sut.checkOffMovieAtIndex(index: 0)
        
        XCTAssertEqual(sut.moviesToSeeCount, 1)
        XCTAssertEqual(sut.moviesSeenCount, 1)
        
        sut.clearArrays()
        
        XCTAssertEqual(sut.moviesToSeeCount, 0)
        XCTAssertEqual(sut.moviesSeenCount, 0)
    }
    
    // MARK: Duplicates
    func testDuplicateMovies_ShouldNotBeAddedToArray() {
        sut.addMovie(movie: sciFiMovie)
        sut.addMovie(movie: sciFiMovie)
        
        XCTAssertEqual(sut.moviesToSeeCount, 1)
    }
}
