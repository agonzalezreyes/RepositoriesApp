//
//  RepositoryItem.swift
//  Repositories
//
//  Created by Alejandrina Gonzalez Reyes on 3/31/22.
//

// Conforms to Identifiable for ForEach
// Conforms to Equatable for == check 
struct RepositoryItem: Codable, Identifiable, Equatable {
    let id: Int
    let name: String
    let login: String
    let avatar_url: String
    
    enum OuterKeys: String, CodingKey {
        case owner, id, name
    }
    enum OwnerKeys: String, CodingKey {
        case avatar_url, login
    }
    
    init(from decoder: Decoder) throws {
        let outerContainer = try decoder.container(keyedBy: OuterKeys.self)
        let ownerContainer = try outerContainer.nestedContainer(keyedBy: OwnerKeys.self, forKey: .owner)
        self.id = try outerContainer.decode(Int.self, forKey: .id)
        self.name = try outerContainer.decode(String.self, forKey: .name)
        self.login = try ownerContainer.decode(String.self, forKey: .login)
        self.avatar_url = try ownerContainer.decode(String.self, forKey: .avatar_url)
    }
}
