//
//  PopularMoviesViewModel.swift
//  IMDBViewer
//
//  Created by Cong Le on 19/04/2021.
//

import Foundation
import UIKit

struct HomeCellViewModel {
	var movie: [Movie] = []
	var type: MovieType = .popular
	var cellIdentifier: String {
		get {
			switch type {
			case .popular:
				return PopularMovieCell.reuseIdentifier
			case .upcoming:
				return UpcomingCollectionViewCell.reuseIdentifier
			default:
				return "UICollectionViewCell"
			}
		}
	}
}

class HomeViewModel: NSObject {
	
	var list: [HomeCellViewModel] = [HomeCellViewModel(), HomeCellViewModel()]
	var reloadCollectionView: () -> Void
	var collectionViewDelgate: UICollectionViewDelegate?
	var popular: HomeCellViewModel {
		get {
			return list[1]
		}
		
		set(newPopular) {
			list[1] = newPopular
		}
	}
	var upcoming: HomeCellViewModel {
		get {
			return list[0]
		}
		set (newUpcoming){
			list[0] = newUpcoming
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

					self.list[0].movie = films.movies
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
					self?.upcoming = HomeCellViewModel.init(movie: movieListResponse.movies, type: .upcoming)
				}
				if movieType == .popular {
					self?.popular = HomeCellViewModel.init(movie: movieListResponse.movies, type: .popular)
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
		return list.count
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		if section == 0 {
			return list[section].movie.count == 0 ? 0 : 1
		}
		
		return list[section].movie.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let movie = list[indexPath.section]
		let cellIdentifier = list[indexPath.section].cellIdentifier

		switch list[indexPath.section].type {
		case .upcoming:

			if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UpcomingCollectionViewCell.reuseIdentifier, for: indexPath) as? UpcomingCollectionViewCell {
				
				cell.setViewModel(viewModel: list[indexPath.section])
				cell.setCollectionViewDelegate(delegate: collectionViewDelgate as! UICollectionViewDelegate)
				return cell
			}
		case .popular:
			if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularMovieCell.reuseIdentifier, for: indexPath) as? PopularMovieCell {
					
				cell.setViewModel(viewModel: list[indexPath.section].movie[indexPath.row])
				
				return cell
			}

		default:
			return UICollectionViewCell()
		}

		return UICollectionViewCell()
	}
	
	func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
		
//		if (kind == UICollectionView.elementKindSectionHeader) {
//			let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: OverviewHeaderCollectionViewCell.reuseIdentifier, for: indexPath)
//			return header
//		}
		
		return UIView.init() as! UICollectionReusableView
	}

}
