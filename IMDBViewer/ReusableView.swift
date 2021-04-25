//
//  ReusableView.swift
//  JerrysPlan
//
//  Created by Cong Le on 08/11/2019.
//  Copyright © 2019 Cong Le. All rights reserved.
//

import UIKit

protocol ReusableView: class {
	static var defaultReuseIdentifier: String { get }
}

extension ReusableView where Self: UIView {
	static var defaultReuseIdentifier: String {
		return String(describing: self)
	}
	
	static var nib: UINib {
		return UINib(nibName: defaultReuseIdentifier, bundle: nil)
	}

	static var nibName: String {
		return String(describing: self)
	}
}

extension UITableViewCell: ReusableView {
}

extension UICollectionViewCell: ReusableView {
}

extension UICollectionReusableView: ReusableView {
	
}

protocol NibLoadableView: class {
	static var nibName: String { get }
	static var cellIdentifier: String { get }
}

extension NibLoadableView where Self: UIView {
	static var nibName: String {
		return NSStringFromClass(self).components(separatedBy: ".").last!
	}
	static var cellIdentifier: String {
		return nibName
	}
}

extension UITableView {
	
	func register<T: UITableViewCell>(_: T.Type) where T: ReusableView {
		register(T.self, forCellReuseIdentifier: T.defaultReuseIdentifier)
	}

	func register<T: UITableViewCell>(_: T.Type) where T: ReusableView, T: NibLoadableView {
		let bundle = Bundle(for: T.self)
		let nib = UINib(nibName: T.nibName, bundle: bundle)
		register(nib, forCellReuseIdentifier: T.defaultReuseIdentifier)
	}

//	func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: NSIndexPath) -> T {
//		guard let cell = dequeueReusableCell(withIdentifier: T.defaultReuseIdentifier, for: indexPath as IndexPath) as? T else {
//			fatalError("Could not dequeue cell with identifier: \(T.defaultReuseIdentifier)")
//		}
//
//		return cell
//	}
}

extension UICollectionView {
	

	func register<T: UICollectionViewCell>(_: T.Type) where T: ReusableView, T: NibLoadableView {
		register(T.nib, forCellWithReuseIdentifier: T.defaultReuseIdentifier)
	}

	
	func register<T: UICollectionViewCell>(_: T.Type) {
		register(T.nib, forCellWithReuseIdentifier: T.defaultReuseIdentifier)
	}

	func register<T: UICollectionReusableView>(_: T.Type, forSupplementaryViewOfKind kind: String) {
//		register(T.nib, forSupplementaryViewOfKind: kind, withReuseIdentifier: T.defaultReuseIdentifier)
		register(T.self, forSupplementaryViewOfKind: kind)

	}

//	func dequeueReusableCell<T: UICollectionViewCell>(forIndexPath indexPath: NSIndexPath) -> T {
//		guard let cell = dequeueReusableCell(withReuseIdentifier: T.defaultReuseIdentifier, for: indexPath as IndexPath) as? T else {
//			fatalError("Could not dequeue cell with identifier: \(T.defaultReuseIdentifier)")
//		}
//
//		return cell
//	}
}

protocol CustomCell {
	func setViewModel<T>(viewModel: T)
}
