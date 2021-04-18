//
//  ViewController.swift
//  IMDBViewer
//
//  Created by Cong Le on 18/04/2021.
//

import UIKit

class ViewController: UIViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		
		print(readLocalFile(forName: "FilmResponse") ?? "")
		
	}
	
	func loadKeys() {
		if let path = Bundle.main.path(forResource: "keys", ofType: "plist") {
			let keys = NSDictionary(contentsOfFile: path)
			print(keys)
		}
	}
	
	func readLocalFile(forName name: String) -> Data? {
		if let path = Bundle.main.path(forResource: name, ofType: "json") {
			do {
				let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
				let decoder = JSONDecoder()
				if let film = try? decoder.decode(Film.self, from: data) {
					print(film)
				}
			} catch {
			}
		}
		
		return nil
	}
	
	
}

