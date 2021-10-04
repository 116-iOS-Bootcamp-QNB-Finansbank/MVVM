//
//  MovieListBuilder.swift
//  MVC
//
//  Created by Semih Emre ÜNLÜ on 2.10.2021.
//

import UIKit

class MovieListBuilder {
    static func build() -> MovieListViewController {
        let storyboard = UIStoryboard(name: "MovieList", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "MovieListViewController") as! MovieListViewController
        viewController.viewModel = MovieListViewModel(service: appContainer.service)
        return viewController
    }
}
