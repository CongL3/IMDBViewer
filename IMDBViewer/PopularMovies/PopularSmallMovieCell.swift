//
//  PopularSmallMovieCell.swift
//  IMDBViewer
//
//  Created by Cong Le on 30/04/2021.
//

import Foundation
import UIKit
import Reusable

class PopularSmallMovieCell: UICollectionViewCell, NibReusable {
	
	@IBOutlet weak var ratingsLabel: UILabel!
	@IBOutlet weak var imageView: UIImageView!
	
	@IBOutlet weak var widthConstraint: NSLayoutConstraint!
	@IBOutlet weak var titleLabel: UILabel!
	
	override func awakeFromNib() {
		super.awakeFromNib()
		
		backgroundColor = .clear
		
		imageView.layer.cornerRadius = 10
		imageView.clipsToBounds = true
		backgroundColor = .clear
		titleLabel.textColor = .fontColor
		ratingsLabel.textColor = .fontColor
		
		layer.masksToBounds = false
		layer.shadowOpacity = 0.23
		layer.shadowRadius = 4
		layer.shadowOffset = CGSize(width: 0, height: 0)
		layer.shadowColor = UIColor.black.cgColor

	}
	
	func setViewModel(viewModel: Any) {
		let movie = viewModel as! Movie
		
		self.widthConstraint.constant = 120

		self.imageView.kf.setImage(with: URL(string: movie.posterUrl))

		self.titleLabel.text = movie.title
		self.ratingsLabel.text = "\(movie.voteAverage)/10"
	}
	
}
