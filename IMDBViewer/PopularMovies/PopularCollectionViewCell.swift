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
		
		self.collectionView.register(cellType: PopularMovieCell.self)
		self.collectionView.dataSource = self

		self.collectionView.backgroundColor = .black
		
		let layout = UICollectionViewFlowLayout.init()
		layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
		layout.scrollDirection = .horizontal
		layout.itemSize = CGSize.init(width: 120, height: 150)
		collectionView.collectionViewLayout = layout
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
		
		if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularMovieCell.reuseIdentifier, for: indexPath) as? PopularMovieCell {
			
			cell.setViewModel(viewModel: viewModel[indexPath.row])
			return cell
		}
		
		return UICollectionViewCell()
	}
	
	
	
}
