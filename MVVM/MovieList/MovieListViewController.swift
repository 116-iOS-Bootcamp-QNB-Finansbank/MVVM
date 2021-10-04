//
//  ViewController.swift
//  MVC
//
//  Created by Semih Emre ÜNLÜ on 2.10.2021.
//

import UIKit

class MovieListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.viewDidLoad()
    }
    
    var movies: [MovieListPresentation] = []
    
    var viewModel: MovieListViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }
}

extension MovieListViewController: MovieListViewModelDelegate {
    func navigate(to route: MovieListViewRoute) {
        switch route {
        case .showMovieDetail(let movie):
            let viewController = MovieDetailBuilder.build(with: movie)
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    func handleOutput(_ output: MovieListViewModelOutput) {
        switch output {
        case .showMovieList(let movies):
            self.movies = movies
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

extension MovieListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectRow(at: indexPath)
    }
}

extension MovieListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieListTableViewCell", for: indexPath)
        cell.textLabel?.text = movies[indexPath.row].title
        return cell
    }
}
