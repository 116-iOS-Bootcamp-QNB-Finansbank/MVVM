//
//  MovieListContracts.swift
//  MVC
//
//  Created by Semih Emre ÜNLÜ on 2.10.2021.
//

import Foundation

protocol MovieListViewModelProtocol {
    var delegate: MovieListViewModelDelegate? { get set }
    func viewDidLoad()
    func didSelectRow(at indexPath: IndexPath)
}

enum MovieListViewModelOutput {
    case showMovieList([MovieListPresentation])
}

enum MovieListViewRoute {
    case showMovieDetail(Result)
}

protocol MovieListViewModelDelegate: NSObject {
    func handleOutput(_ output: MovieListViewModelOutput)
    func navigate(to route: MovieListViewRoute)
}
