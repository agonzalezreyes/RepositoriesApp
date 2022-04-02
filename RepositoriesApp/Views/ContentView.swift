//
//  ContentView.swift
//  Repositories
//
//  Created by Alejandrina Gonzalez Reyes on 3/31/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var model: Model
    var vGridLayout = [ GridItem(.flexible()) ]
    let title = "Repositories"
    let description = "A repository is like a folder for your project. Your project's repository contains all of your project's files and stores each file's revision history. You can also discuss and manage your project's work within the repository."
    var body: some View {
        ElementsListView(title: self.title, description: self.description, elements: model.fetchState.elements, isLoading: model.fetchState.canFetchContent, scrolledToBottom: model.fetchContent).onAppear(perform: model.fetchContent)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(model: Model())
    }
}
