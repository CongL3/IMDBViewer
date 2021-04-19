//
//  ViewController.swift
//  IMDBViewer
//
//  Created by Cong Le on 18/04/2021.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate {
	
	
	@IBOutlet weak var collectionView: UICollectionView!
	let viewModel = PopularMoviesViewModel()
	
	override func viewDidLoad() {
		super.viewDidLoad()

		self.collectionView.delegate = self
		self.collectionView.dataSource = viewModel

		self.collectionView.register(PopularMovieCell.self)
		let layout = UICollectionViewFlowLayout.init()
		layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
		layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
		layout.scrollDirection = .vertical
		collectionView.collectionViewLayout = layout
		
		viewModel.reloadCollectionView = {
			self.collectionView.reloadData()
		}
	}
	
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		performSegue(withIdentifier: "showMovieDetails", sender: viewModel.movies[indexPath.row])
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "showMovieDetails" {
			if let viewController = segue.destination as? MovieDetailViewController {
				viewController.movie = (sender as? Movie)!
			}
		}
	}

	
	func loadKeys() {
		if let path = Bundle.main.path(forResource: "keys", ofType: "plist") {
			let keys = NSDictionary(contentsOfFile: path)
			print(keys)
		}
	}
		
}

