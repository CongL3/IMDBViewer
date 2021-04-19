//
//  PopularMoviesViewModel.swift
//  IMDBViewer
//
//  Created by Cong Le on 19/04/2021.
//

import Foundation
import UIKit

class PopularMoviesViewModel: NSObject {
	
	var movies = [Movie]()
	var reloadCollectionView: () -> Void

	private let apiService = MovieAPI.shared

	override init() {
		self.reloadCollectionView = {
			print("reloadCollectionView")
		}
		
		super.init()
		self.fetchMovies(movieType: .popular)
	}
	
	func readLocalFile(forName name: String) -> Data? {
		if let path = Bundle.main.path(forResource: name, ofType: "json") {
			do {
				let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
				let decoder = JSONDecoder()

				if let films = try? decoder.decode(MovieListResponse.self, from: data) {

					self.movies = films.movies
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
				self?.movies = movieListResponse.movies
				self?.reloadCollectionView()
			case .failure(let error):
				print(error.localizedDescription)
			}
		}
	}
}

extension PopularMoviesViewModel: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return movies.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let movie = movies[indexPath.row]
		let cellIdentifier = PopularMovieCell.defaultReuseIdentifier

		if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? PopularMovieCell {
			cell.setViewModel(movie: movie)
			return cell
		}
		return UICollectionViewCell()
	}
}
