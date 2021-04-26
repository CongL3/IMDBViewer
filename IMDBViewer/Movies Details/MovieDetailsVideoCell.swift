//
//  MovieDetailsVideoCell.swift
//  IMDBViewer
//
//  Created by Cong Le on 19/04/2021.
//

import Foundation
import UIKit
import youtube_ios_player_helper
import Reusable

class MovieDetailsVideoCell: UICollectionViewCell, NibReusable {
	
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
		self.titleLabel.text = movie.title
		self.overViewLabel.text = movie.overview
	}
	
	func setMovieTrailer(movieTrailer: MovieTrailer) {
		if movieTrailer.youtubeVideoId == "" {
			return
		}
		
		self.ytViewer.load(withVideoId: movieTrailer.youtubeVideoId)
	}
}
