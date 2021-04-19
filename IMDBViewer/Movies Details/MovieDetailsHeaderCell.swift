//
//  MovieDetailsHeaderCell.swift
//  IMDBViewer
//
//  Created by Cong Le on 19/04/2021.
//

import Foundation
import UIKit
import Kingfisher

class MovieDetailsHeaderCell: UICollectionReusableView {
	@IBOutlet weak var imageView: UIImageView!
	@IBOutlet weak var directorNameLabel: UILabel!
	
	override init(frame: CGRect) {
	   super.init(frame: frame)
//	   self.backgroundColor = UIColor.purple

	}

	required init?(coder aDecoder: NSCoder) {
	   super.init(coder: aDecoder)

	}

	override class func awakeFromNib() {
		super.awakeFromNib()
		
	}

	func setViewModel(movie: Movie) {
		self.imageView.kf.setImage(with: URL(string: movie.posterUrl))
		self.directorNameLabel.text = "\(movie.identifier)"
	}

}
