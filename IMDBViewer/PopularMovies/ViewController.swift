//
//  ViewController.swift
//  IMDBViewer
//
//  Created by Cong Le on 18/04/2021.
//

import UIKit

class ViewController: UIViewController {
	
	
	@IBOutlet weak var collectionView: UICollectionView!
	let viewModel = HomeViewModel()
	
	override func viewDidLoad() {
		super.viewDidLoad()

		title = "Movies"
		
		collectionView.delegate = self
		collectionView.dataSource = viewModel
		
		viewModel.collectionViewDelgate = self
//		collectionView.register(cellType: PopularMovieCell.self)
		collectionView.register(cellType: PopularCollectionViewCell.self)
		collectionView.register(cellType: UpcomingCollectionViewCell.self)
		
		collectionView.register(supplementaryViewType: HomeSectionHeader.self, ofKind: UICollectionView.elementKindSectionHeader)
		
		let layout = UICollectionViewFlowLayout.init()
		layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
		layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
		layout.scrollDirection = .vertical
		layout.headerReferenceSize = CGSize.init(width: UIScreen.main.bounds.width, height: 40)
		layout.footerReferenceSize = CGSize.init(width: UIScreen.main.bounds.width, height: 0)
		collectionView.collectionViewLayout = layout
		
		collectionView.backgroundColor = .white
		viewModel.reloadCollectionView = {
			self.collectionView.reloadData()
		}
	}
	
	override func viewWillLayoutSubviews() {
		super.viewWillLayoutSubviews()
		
		collectionView.collectionViewLayout.invalidateLayout()
	}

	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		performSegue(withIdentifier: "showMovieDetails", sender: viewModel.list[indexPath.section].movie[indexPath.row])
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "showMovieDetails" {
			if let viewController = segue.destination as? MovieDetailViewController {
				viewController.viewModel.movie = (sender as? Movie)!
			}
		}
	}

}


extension ViewController: UICollectionViewDelegate {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
		
		if let headerView = collectionView.visibleSupplementaryViews(ofKind: UICollectionView.elementKindSectionHeader).first as? HomeSectionHeader {
			// Layout to get the right dimensions
			headerView.layoutIfNeeded()
			
			// Automagically get the right height
			let height = headerView.contentView.systemLayoutSizeFitting(UIView.layoutFittingExpandedSize).height
			
			// return the correct size
			return CGSize(width: collectionView.frame.width, height: height)
		}
		
		// You need this because this delegate method will run at least
		// once before the header is available for sizing.
		// Returning zero will stop the delegate from trying to get a supplementary view
		return CGSize(width: 1, height: 1)
	}
	
}
