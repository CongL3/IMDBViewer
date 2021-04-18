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
		
	override init() {
		super.init()
		self.readLocalFile(forName: "FilmResponse")
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
