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
	}
}
