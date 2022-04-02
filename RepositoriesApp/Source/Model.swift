//
//  ModelView.swift
//  Repositories
//
//  Created by Alejandrina Gonzalez Reyes on 4/1/22.
//

import Combine

struct FetchState {
    var elements: [RepositoryItem] = []
    var pageNum: Int = 1
    var canFetchContent = true
}

class Model: ObservableObject {
    @Published private(set) var fetchState = FetchState()
    private var subscriptions = Set<AnyCancellable>()

    func fetchContent() {
        guard fetchState.canFetchContent else {
            return
        }
        API.fetchAllRepositories(page: fetchState.pageNum).sink(receiveCompletion: onReceiveCompletion, receiveValue: onReceiveValue)
            .store(in: &subscriptions)
    }

    private func onReceiveValue(_ batch: [RepositoryItem]){
        fetchState.elements += batch
        fetchState.canFetchContent = API.numElems == batch.count
        fetchState.pageNum += 1
    }

    private func onReceiveCompletion(_ completion: Subscribers.Completion<Error>) {
        switch completion {
        case .failure:
            fetchState.canFetchContent = false
        default:
            break
        }
    }
}

