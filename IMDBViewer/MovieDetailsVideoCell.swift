//
//  MovieDetailsVideoCell.swift
//  IMDBViewer
//
//  Created by Cong Le on 19/04/2021.
//

import Foundation
import UIKit
import youtube_ios_player_helper

class MovieDetailsVideoCell: UICollectionViewCell {
	
	@IBOutlet weak var ytViewer: YTPlayerView!
	@IBOutlet weak var customView: UIView!
	@IBOutlet weak var overViewLabel: UILabel!
	@IBOutlet weak var overviewTitleLabel: UILabel!
	@IBOutlet weak var titleLabel: UILabel!
	override func awakeFromNib() {
		super.awakeFromNib()
		self.backgroundColor = UIColor.green
		
	}
	
	func setViewModel(movie: Movie) {
		print("MovieDetailsVideoCell \(movie)")
		self.titleLabel.text = movie.title
		self.overViewLabel.text = movie.overview
		self.ytViewer.load(withVideoId: "odM92ap8_c0")
	}
}
