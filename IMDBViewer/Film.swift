//
//  Film.swift
//  IMDBViewer
//
//  Created by Cong Le on 18/04/2021.
//


struct Film : Codable {
	var title : String
	var year : String
	var rated : String
	var released : String
	
	enum CodingKeys: String, CodingKey {
		case title = "Title"
		case year = "Year"
		case rated = "Rated"
		case released = "Released"
	}
	

}


//	init(from decoder: Decoder) throws {
//		let container = try decoder.container(keyedBy: CodingKeys.self)
//		title = try container.decode(String.self, forKey: .title)
//		year = try container.decode(String.self, forKey: .year)
//		rated = try container.decode(String.self, forKey: .rated)
//		released = try container.decode(String.self, forKey: .released)
//	}
//
//
//	func encode(to encoder: Encoder) throws {
//
//	}
