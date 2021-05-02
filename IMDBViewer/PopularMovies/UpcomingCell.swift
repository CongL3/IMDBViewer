//
//  UpcomingCollectionView.swift
//  IMDBViewer
//
//  Created by Cong Le on 25/04/2021.
//

import Foundation
import UIKit
import Reusable

class UpcomingCell: UICollectionViewCell, NibReusable {

	@IBOutlet weak var imageView: UIImageView!
	@IBOutlet weak var mainView: UIView!
	@IBOutlet weak var widthConstraint: NSLayoutConstraint!

	@IBOutlet weak var releaseDateLabel: UILabel!
	@IBOutlet weak var titleLabel: UILabel!
	override func awakeFromNib() {
		super.awakeFromNib()
		backgroundColor = .clear
		layer.masksToBounds = false
		layer.shadowOpacity = 0.23
		layer.shadowRadius = 4
		layer.shadowOffset = CGSize(width: 0, height: 0)
		layer.shadowColor = UIColor.black.cgColor
		
		contentView.layer.cornerRadius = 25

		titleLabel.textColor = .white
		releaseDateLabel.textColor = .white
	}

	func setViewModel(viewModel: Movie) {
		self.titleLabel.text = viewModel.title
		self.widthConstraint.constant = UIScreen.main.bounds.width + 60
		self.imageView.kf.setImage(with: URL(string: viewModel.posterUrl))
		self.releaseDateLabel.text = viewModel.releaseDate
	}
	
}
