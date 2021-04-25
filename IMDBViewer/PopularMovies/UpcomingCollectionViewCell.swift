//
//  UpcomingCollectionViewCell.swift
//  IMDBViewer
//
//  Created by Cong Le on 25/04/2021.
//

import Foundation
import UIKit

class UpcomingCollectionViewCell: UICollectionViewCell, UICollectionViewDataSource {
	
	
	@IBOutlet weak var collectionView: UICollectionView!
	var viewModel = [Movie]()
	
	override func awakeFromNib() {
		super.awakeFromNib()
		self.backgroundColor = UIColor.gray
		
		self.collectionView.register(UpcomingCell.self)
		self.collectionView.dataSource = self
		
		let layout = UICollectionViewFlowLayout.init()
		layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
//		layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
		layout.scrollDirection = .horizontal
		layout.itemSize = CGSize.init(width: UIScreen.main.bounds.width + 60, height: 230)
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
		
		if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UpcomingCell.defaultReuseIdentifier, for: indexPath) as? UpcomingCell {
			
			cell.setViewModel(viewModel: viewModel[indexPath.row])
			return cell
		}
		
		return UICollectionViewCell()
	}
	
	

}
