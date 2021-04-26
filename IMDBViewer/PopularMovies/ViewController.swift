//
//  ViewController.swift
//  IMDBViewer
//
//  Created by Cong Le on 18/04/2021.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate {
	
	
	@IBOutlet weak var collectionView: UICollectionView!
	let viewModel = HomeViewModel()
	
	override func viewDidLoad() {
		super.viewDidLoad()

		self.title = "Movies"
		
		self.collectionView.delegate = self
		self.collectionView.dataSource = viewModel

		viewModel.collectionViewDelgate = self
		self.collectionView.register(PopularMovieCell.self)
		self.collectionView.register(UpcomingCollectionViewCell.self)
//		self.collectionView.register(HomeSectionHeader.self)
		
		let layout = UICollectionViewFlowLayout.init()
		layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
		layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
		layout.scrollDirection = .vertical
		collectionView.collectionViewLayout = layout
		
		collectionView.backgroundColor = .white
		viewModel.reloadCollectionView = {
			self.collectionView.reloadData()
		}
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

