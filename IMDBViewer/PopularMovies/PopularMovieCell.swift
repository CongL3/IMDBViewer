//
//  PopularMovieCell.swift
//  IMDBViewer
//
//  Created by Cong Le on 19/04/2021.
//

import Foundation
import UIKit
import Reusable

//protocol MovieCellProtocol: UICollectionViewCell {
//	func setViewModel(viewModel: Any)
//}

class PopularMovieCell: UICollectionViewCell, NibReusable {
	
	@IBOutlet weak var posterImageView: UIImageView!
	
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var ratingsLabel: UILabel!
	@IBOutlet weak var releaseDateLabel: UILabel!
	@IBOutlet weak var overViewLabel: UILabel!
	
	@IBOutlet weak var widthConstraint: NSLayoutConstraint!
	
	func setViewModel(viewModel: Any) {
		let movie = viewModel as! Movie
		self.widthConstraint.constant = UIScreen.main.bounds.width - 60

		self.posterImageView.kf.setImage(with: URL(string: movie.posterUrl))

		self.titleLabel.text = movie.title
		self.ratingsLabel.text = "\(movie.voteAverage)/10"
		self.releaseDateLabel.text = movie.releaseDate
		self.overViewLabel.text = movie.overview

//		titleLabel.textColor = .fontColor
//		ratingsLabel.textColor = .fontColor
//		releaseDateLabel.textColor = .fontColor
//		overViewLabel.textColor = .fontColor
	}
	
	override func awakeFromNib() {
		super.awakeFromNib()
		self.backgroundColor = UIColor.gray
	}
}
