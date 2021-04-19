//
//  MovieDetailsHeaderCell.swift
//  IMDBViewer
//
//  Created by Cong Le on 19/04/2021.
//

import Foundation
import UIKit

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
		print("MovieDetailsVideoCell \(movie)")
		
		self.imageView.downloaded(from: "https://image.tmdb.org/t/p/w500/\(movie.posterPath ?? "pgqgaUx1cJb5oZQQ5v0tNARCeBp.jpg")")
		self.directorNameLabel.text = "\(movie.identifier)"
	}

}
