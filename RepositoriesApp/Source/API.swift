//
//  API.swift
//  Repositories
//
//  Created by Alejandrina Gonzalez Reyes on 3/31/22.
//

import Foundation
import Combine

enum API {
    static let numElems = 10
    static func fetchAllRepositories(page: Int) -> AnyPublisher<[RepositoryItem], Error> {
        let reposUrl = URL(string: "https://api.github.com/search/repositories?q=is:public&per_page=\(numElems)&page=\(page)")!
        return URLSession.shared.dataTaskPublisher(for: reposUrl)
            .handleEvents(receiveOutput: { print(NSString(data: $0.data, encoding: String.Encoding.utf8.rawValue)!) })
            .tryMap {
            try JSONDecoder().decode(Result<RepositoryItem>.self, from: $0.data).items
        }.receive(on: DispatchQueue.main).eraseToAnyPublisher()
    }
}

struct Result<T: Codable>: Codable {
    let items: [T]
}
