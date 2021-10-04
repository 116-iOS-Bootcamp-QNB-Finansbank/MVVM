//
//  MovieListViewModel.swift
//  MVVM
//
//  Created by Semih Emre ÜNLÜ on 3.10.2021.
//

import Foundation

class MovieListViewModel: MovieListViewModelProtocol {
    weak var delegate: MovieListViewModelDelegate?
    
    private let service: ClientNetworkServiceProtocol!
    private var movies: [Result] = []
    
    init(service: ClientNetworkServiceProtocol) {
        self.service = service
    }
    
    func viewDidLoad() {
        getMovies()
    }
    
    func getMovies() {
        service.movies { [weak self] response, error in
            guard let self = self else { return }
            guard let results = response?.feed.results else { return }
            self.movies = results
            self.delegate?.handleOutput(.showMovieList(results.map(MovieListPresentation.init)))
        }
    }
    
    func didSelectRow(at indexPath: IndexPath) {
        let movie = movies[indexPath.row]
        self.delegate?.navigate(to: .showMovieDetail(movie))
    }
}
