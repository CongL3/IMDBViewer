//
//  PopularMoviesViewModel.swift
//  IMDBViewer
//
//  Created by Cong Le on 19/04/2021.
//

import Foundation
import UIKit

class HomeViewModel: NSObject {
	
	var movies: [[Movie]] = [[],[]]
	var reloadCollectionView: () -> Void
	var popular: [Movie] {
		get {
			return movies[1]
		}
		
		set(newPopular) {
			movies.insert(newPopular, at: 1)
		}
	}
	var upcoming: [Movie] {
		get {
			return movies[0]
		}
		set (newUpcoming){
			movies.insert(newUpcoming, at: 0)
		}
	}

	private let apiService = MovieAPI.shared

	override init() {
		self.reloadCollectionView = {
			print("reloadCollectionView")
		}
		
		super.init()
		self.fetchMovies(movieType: .popular)
		self.fetchMovies(movieType: .upcoming)
	}
	
	func readLocalFile(forName name: String) -> Data? {
		if let path = Bundle.main.path(forResource: name, ofType: "json") {
			do {
				let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
				let decoder = JSONDecoder()

				if let films = try? decoder.decode(MovieListResponse.self, from: data) {

					self.movies[0] = films.movies
					print("number of movies \(films.movies.count)")
				}
			} catch {
			}
		}
			
		return nil
	}
	
	private func fetchMovies(movieType: MovieType) {

		let parameters: [String: Any]? = ["page": 1]

		apiService.fetchMovies(movieType: movieType, parameters: parameters) { [weak self] result in
			switch result {
			case .success(let movieListResponse):
				if movieType == .upcoming {
					self?.upcoming = movieListResponse.movies
				}
				if movieType == .popular {
					self?.popular = movieListResponse.movies
				}
				self?.reloadCollectionView()
			case .failure(let error):
				print(error.localizedDescription)
			}
		}
	}
}

extension HomeViewModel: UICollectionViewDataSource {
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return movies.count
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return movies[section].count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let movie = movies[indexPath.section][indexPath.row]
		let cellIdentifier = PopularMovieCell.defaultReuseIdentifier

		if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? PopularMovieCell {
			cell.setViewModel(movie: movie)
			return cell
		}
		return UICollectionViewCell()
	}
}
