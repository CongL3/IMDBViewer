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
		
		viewModel.collectionViewDelgateA = self
		viewModel.collectionViewDelgateB = self
		collectionView.register(cellType: PopularCollectionViewCell.self)
		collectionView.register(cellType: UpcomingCollectionViewCell.self)
		
		collectionView.register(supplementaryViewType: HomeSectionHeader.self, ofKind: UICollectionView.elementKindSectionHeader)
		
		let layout = UICollectionViewFlowLayout.init()
		layout.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
		layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
		layout.scrollDirection = .vertical
		layout.headerReferenceSize = CGSize.init(width: UIScreen.main.bounds.width, height: 60)
		collectionView.collectionViewLayout = layout
		
		viewModel.reloadCollectionView = {
			self.collectionView.reloadData()
		}
		collectionView.backgroundColor = .clear
		view.backgroundColor = UIColor.init(rgb: 255, green: 206, blue: 0, alpha: 1)
	}
	
	override func viewWillLayoutSubviews() {
		super.viewWillLayoutSubviews()
		
		collectionView.collectionViewLayout.invalidateLayout()
	}

	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

		if ((collectionView.dataSource?.isKind(of: UpcomingCollectionViewCell.self)) == true) {
			performSegue(withIdentifier: "showMovieDetails", sender: viewModel.list[indexPath.section].movie[indexPath.row])
		}

		if ((collectionView.dataSource?.isKind(of: PopularCollectionViewCell.self)) == true) {
			performSegue(withIdentifier: "showMovieDetails", sender: viewModel.list[1].movie[indexPath.row])
		}
		
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
			headerView.layoutIfNeeded()
			
			let height = headerView.contentView.systemLayoutSizeFitting(UIView.layoutFittingExpandedSize).height
			
			return CGSize(width: collectionView.frame.width, height: height)
		}
		
		return CGSize(width: 1, height: 1)
	}
	
}
