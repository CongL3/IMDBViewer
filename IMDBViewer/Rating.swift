//
//  Rating.swift
//  IMDBViewer
//
//  Created by Cong Le on 18/04/2021.
//

struct Rating: Codable {
	var source: String
	var value: String

	enum CodingKeys: String, CodingKey {
		case source = "Source"
		case value = "Value"
	}
}
