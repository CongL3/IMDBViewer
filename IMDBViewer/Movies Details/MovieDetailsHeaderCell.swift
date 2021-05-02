//
//  MovieDetailsHeaderCell.swift
//  IMDBViewer
//
//  Created by Cong Le on 19/04/2021.
//

import Foundation
import UIKit
import Kingfisher
import Reusable

class MovieDetailsHeaderCell: UICollectionReusableView, Reusable {
	@IBOutlet weak var imageView: UIImageView!
	@IBOutlet weak var directorNameLabel: UILabel!
	
	@IBOutlet weak var directorTitleLabel: UILabel!
	@IBOutlet weak var producerTitleLabel: UILabel!
	@IBOutlet weak var producerNameLabel: UILabel!
	override init(frame: CGRect) {
	   super.init(frame: frame)

	}

	required init?(coder aDecoder: NSCoder) {
	   super.init(coder: aDecoder)
	}

	override class func awakeFromNib() {
		super.awakeFromNib()
	}

	func setViewModel(viewModel: MovieDetailViewModel) {
		let movie = viewModel.movie
		self.imageView.kf.setImage(with: URL(string: movie.posterUrl))
		self.directorNameLabel.text = viewModel.directorsName
		self.directorTitleLabel.text = viewModel.directorsTitle
		self.producerTitleLabel.text = viewModel.producerTitle
		self.producerNameLabel.text = viewModel.producerName
	}

}
