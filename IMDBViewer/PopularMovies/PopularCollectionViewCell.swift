//
//  PopularCollectionViewCell.swift
//  IMDBViewer
//
//  Created by Cong Le on 27/04/2021.
//

import Foundation
import UIKit
import Reusable

class PopularCollectionViewCell: UICollectionViewCell, UICollectionViewDataSource, NibReusable {
	
	
	@IBOutlet weak var collectionView: UICollectionView!
	var viewModel = [Movie]()
	
	override func awakeFromNib() {
		super.awakeFromNib()
		
		self.collectionView.register(cellType: PopularSmallMovieCell.self)
		self.collectionView.dataSource = self

		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .horizontal
		layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
		layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
		collectionView.collectionViewLayout = layout
		
		backgroundColor = .clear
		collectionView.backgroundColor = .clear

	}
	
	func setViewModel(viewModel: Any) {
		let vm = viewModel as! HomeCellViewModel
		self.viewModel = vm.movie
		self.layoutIfNeeded()
	}
	
	func setCollectionViewDelegate(delegate: UICollectionViewDelegate) {
		self.collectionView.delegate = delegate
	}
	
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		viewModel.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularSmallMovieCell.reuseIdentifier, for: indexPath) as? PopularSmallMovieCell {
			
			cell.setViewModel(viewModel: viewModel[indexPath.row])
			return cell
		}
		
		return UICollectionViewCell()
	}	
}
