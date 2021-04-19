//
//  MovieDetailViewController.swift
//  IMDBViewer
//
//  Created by Cong Le on 19/04/2021.
//

import Foundation
import UIKit

class MovieDetailViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
	var movie: Movie
	
	@IBOutlet weak var collectionView: UICollectionView!
	required init?(coder aDecoder: NSCoder) {
		self.movie = Movie(identifier: 0, title: "", releaseDate: "", popularity: 0, voteCount: 0, voteAverage: 1, hasVideo: false, posterPath: "", backDropPath: "", overview: "")
		super.init(coder: aDecoder)
	}

	override func viewDidLoad() {
		
		print("MOVIE \(movie)")
		self.collectionView.delegate = self
		self.collectionView.dataSource = self
		self.collectionView.register(MovieDetailsVideoCell.self)
		
//		self.collectionView.register(MovieDetailsHeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader)
		
//		self.collectionView.register(MovieDetailsHeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: MovieDetailsHeaderCell.defaultReuseIdentifier)

		collectionView.register(UINib(nibName: MovieDetailsHeaderCell.defaultReuseIdentifier, bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: MovieDetailsHeaderCell.defaultReuseIdentifier)

		let layout = UICollectionViewFlowLayout.init()
		layout.headerReferenceSize = CGSize(width: UIScreen.main.bounds.width, height: 200)
		layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
		layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
		layout.scrollDirection = .vertical
		collectionView.collectionViewLayout = layout

	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 1
	}
		
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
			return CGSize(width: collectionView.frame.width, height: 180.0)
	}

	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cellIdentifier = MovieDetailsVideoCell.defaultReuseIdentifier

		if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? MovieDetailsVideoCell {
			cell.setViewModel(movie: movie)
			return cell
		}
		return UICollectionViewCell()
	}
		
	func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
		
		if (kind == UICollectionView.elementKindSectionHeader) {
			let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: MovieDetailsHeaderCell.defaultReuseIdentifier, for: indexPath) as? MovieDetailsHeaderCell
			
			header?.setViewModel(movie: movie)
			return header as! UICollectionReusableView
		}
		
		return UIView.init() as! UICollectionReusableView
	}

}
