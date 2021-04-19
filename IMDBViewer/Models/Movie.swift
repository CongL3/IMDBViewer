//
//  Film.swift
//  IMDBViewer
//
//  Created by Cong Le on 18/04/2021.
//

enum MovieType: String, CaseIterable {
	case topRated = "Top Rated"
	case upcoming = "Upcoming"
	case popular = "Popular"
}

struct MovieListResponse: Decodable {

	let currentPage: Int?
	let totalResultsCount: Int?
	let totalPages: Int?
	let movies: [Movie]

	private enum CodingKeys: String, CodingKey {
		case currentPage = "page"
		case totalResultsCount = "total_results"
		case totalPages = "total_pages"
		case movies = "results"
	}
}

struct Movie: Codable {
	let identifier: Int
	let title: String
	let releaseDate: String
	let popularity: Float
	let voteCount: Int
	let voteAverage: Float
	let hasVideo: Bool
	let posterPath: String?
	let backDropPath: String?
	let overview: String
	

	private enum CodingKeys: String, CodingKey {
		case identifier = "id"
		case title = "title"
		case releaseDate = "release_date"
		case popularity = "popularity"
		case voteCount = "vote_count"
		case voteAverage = "vote_average"
		case hasVideo = "video"
		case posterPath = "poster_path"
		case backDropPath = "backdrop_path"
		case overview
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
