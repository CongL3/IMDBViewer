//
//  PopularMovieCell.swift
//  IMDBViewer
//
//  Created by Cong Le on 19/04/2021.
//

import Foundation
import UIKit

class PopularMovieCell: UICollectionViewCell {
	
	@IBOutlet weak var posterImageView: UIImageView!
	
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var ratingsLabel: UILabel!
	@IBOutlet weak var releaseDateLabel: UILabel!
	@IBOutlet weak var overViewLabel: UILabel!
	
	@IBOutlet weak var widthConstraint: NSLayoutConstraint!
	

	//	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//		super.init(style: style, reuseIdentifier: SettingsCell.cellIdentifier)
//	}

	
//	required init?(coder aDecoder: NSCoder) {
//		super.init(coder: aDecoder)
//		self.backgroundColor = UIColor.clear
//		selectionStyle = .none
//	}
	
	func setViewModel(movie: Movie) {
		print("MOVIEEEE \(movie)")
		self.widthConstraint.constant = UIScreen.main.bounds.width - 60
		self.posterImageView.downloaded(from: "https://image.tmdb.org/t/p/w500/\(movie.posterPath ?? "pgqgaUx1cJb5oZQQ5v0tNARCeBp.jpg")")
		self.titleLabel.text = movie.title
		self.ratingsLabel.text = "\(movie.voteAverage)/10"
		self.releaseDateLabel.text = movie.releaseDate
		self.overViewLabel.text = movie.overview
	}
	
	override func awakeFromNib() {
		super.awakeFromNib()
		self.backgroundColor = UIColor.gray
		
//		contentView.translatesAutoresizingMaskIntoConstraints = false
//		
//		NSLayoutConstraint.activate([
//			contentView.leftAnchor.constraint(equalTo: leftAnchor),
//			contentView.rightAnchor.constraint(equalTo: rightAnchor),
//			contentView.topAnchor.constraint(equalTo: topAnchor),
//			contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
//		])

	}

//	override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
//		setNeedsLayout()
//		layoutIfNeeded()
//		let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
//		var newFrame = layoutAttributes.frame
//		// note: don't change the width
//		newFrame.size.height = ceil(size.height)
//		layoutAttributes.frame = newFrame
//		return layoutAttributes
//	}

}
