//
//  MovieDetailViewController.swift
//  IMDBViewer
//
//  Created by Cong Le on 19/04/2021.
//

import Foundation
import UIKit

class MovieDetailViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
	var detailsCell: MovieDetailsVideoCell
	var headerCell: MovieDetailsHeaderCell?
	var viewModel: MovieDetailViewModel
	
	
	@IBOutlet weak var collectionView: UICollectionView!
	required init?(coder aDecoder: NSCoder) {
		self.detailsCell = MovieDetailsVideoCell()
		self.headerCell = MovieDetailsHeaderCell()
		self.viewModel = MovieDetailViewModel()
		super.init(coder: aDecoder)
	}

	override func viewDidLoad() {
		
		self.collectionView.delegate = self
		self.collectionView.dataSource = self
		self.collectionView.register(cellType: MovieDetailsVideoCell.self)
		
		collectionView.register(UINib(nibName: MovieDetailsHeaderCell.reuseIdentifier, bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: MovieDetailsHeaderCell.reuseIdentifier)

		let layout = UICollectionViewFlowLayout.init()
		layout.headerReferenceSize = CGSize(width: UIScreen.main.bounds.width, height: 200)
		layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
		layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
		layout.scrollDirection = .vertical
		collectionView.collectionViewLayout = layout
				
		collectionView.reloadData()
		
		viewModel.updateDetailsCell = {
			self.headerCell?.setViewModel(viewModel: self.viewModel)
		}
		
		viewModel.updateTrailerCell = {
			self.detailsCell.setMovieTrailer(movieTrailer: self.viewModel.movieTrailer)
		}
		
		view.backgroundColor = UIColor.init(rgb: 255, green: 206, blue: 0, alpha: 1)
		collectionView.backgroundColor = .clear
		viewModel.getMovieDetails()
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 1
	}
		
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
			return CGSize(width: collectionView.frame.width, height: 180.0)
	}

	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cellIdentifier = MovieDetailsVideoCell.reuseIdentifier

		if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? MovieDetailsVideoCell {
			cell.setViewModel(movie: self.viewModel.movie)
			self.detailsCell = cell
			return cell
		}
		return UICollectionViewCell()
	}
		
	func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
		
		if (kind == UICollectionView.elementKindSectionHeader) {
			let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: MovieDetailsHeaderCell.reuseIdentifier, for: indexPath) as? MovieDetailsHeaderCell
			self.headerCell = header
			header?.setViewModel(viewModel: viewModel)
			return header!
		}
		
		return UIView.init() as! UICollectionReusableView
	}

}
