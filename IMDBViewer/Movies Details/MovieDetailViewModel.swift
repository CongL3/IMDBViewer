//
//  MovieDetailViewModel.swift
//  IMDBViewer
//
//  Created by Cong Le on 20/04/2021.
//

import Foundation
import UIKit

class MovieDetailViewModel: NSObject {
	var movie: Movie
	var movieTrailer: MovieTrailer
	var movieCastCrewInfo: MovieDetailCastCrewInfo
	private var director: MovieCrew

	var directorsName: String {
		get {
			return director.memberName
		}
	}
	var directorsTitle: String {
		get {
			return director.memberJob
		}
	}

	var producerName: String {
		get {
			return producer.memberName
		}
	}
	var producerTitle: String {
		get {
			return producer.memberJob
		}
	}
	
	private var producer: MovieCrew

	var updateDetailsCell: () -> Void
	var updateTrailerCell: () -> Void

	private let apiService = MovieAPI.shared

	override init() {
		self.movie = Movie.init(identifier: 0, title: "", releaseDate: "", popularity: 0.00, voteCount: 0, voteAverage: 0.00, hasVideo: false, posterPath: nil, backDropPath: nil, overview: "")
		self.movieTrailer = MovieTrailer.init(youtubeVideoId: "")
		self.movieCastCrewInfo = MovieDetailCastCrewInfo.init(movieCrew: [MovieCrew](), movieCast: [MovieCast]())
		self.producer = MovieCrew(memberName: "", memberJob: "")
		self.director = MovieCrew(memberName: "", memberJob: "")
		self.updateDetailsCell = {}
		self.updateTrailerCell = {}
		super.init()
	}
	
	func getMovieDetails() -> Void {
		
		apiService.fetchMovieCastCrew(movieId: movie.identifier, parameters: nil) { result in
			switch result {
			case .success(let movieCastCrewInfo):
					print(movieCastCrewInfo)
				self.director = movieCastCrewInfo.movieCrew.first(where: { movieCrewMember in
						movieCrewMember.memberJob == "Director"
				})!
				self.producer = movieCastCrewInfo.movieCrew.first(where: { movieCrewMember in
						movieCrewMember.memberJob == "Executive Producer" || movieCrewMember.memberJob == "Co-Executive Producer"
							|| movieCrewMember.memberJob == "Director"
				})!
				self.updateDetailsCell()

			case .failure(let error):
				print(error.localizedDescription)
			}
		}
		
		apiService.fetchMovieTrailer(movieId: movie.identifier, parameters: nil) { result in
				switch result {
				case .success(let movieTrailer):
					guard let movieTrailer = movieTrailer.movieTrailers.first else {
						return }
					self.movieTrailer = movieTrailer
					self.updateTrailerCell()
				case .failure(let error):
					print(error.localizedDescription)
				}
		}
	}
	
	
	
	
}
