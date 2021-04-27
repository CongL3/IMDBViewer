//
//  HomeSectionHeader.swift
//  IMDBViewer
//
//  Created by Cong Le on 27/04/2021.
//

import Foundation
import UIKit
import Reusable

class HomeSectionHeader: UICollectionReusableView, NibReusable {
	
	@IBOutlet weak var contentView: UILabel!
	@IBOutlet weak var titleLabel: UILabel!
	override func awakeFromNib() {
		super.awakeFromNib()
		// Initialization code
	}
	
	func setViewModel(text: String) {
		self.titleLabel.text = text
	}
		
}
