//
//  ElementsListView.swift
//  Repositories
//
//  Created by Alejandrina Gonzalez Reyes on 4/1/22.
//

import SwiftUI
import Combine

struct ElementsListView: View {
    let title: String
    let description: String
    let elements: [RepositoryItem]
    let isLoading: Bool
    let scrolledToBottom: () -> Void
    
    var isiPad: Bool = UIDevice.current.userInterfaceIdiom == .pad
    var defaultLayout = [GridItem(.flexible())]
    var ipadLayout = [GridItem(.flexible()), GridItem(.flexible())]
    var padding = 20.0
    
    var body: some View {
        HStack {
        NavigationView {
            ScrollView {
                if isiPad {
                    VStack(alignment: .leading){
                        Text(self.description).foregroundColor(Color.gray)
                        LazyVGrid(columns: ipadLayout) { listView }
                    }.frame(maxWidth: .infinity, alignment: .leading).padding([.leading,.trailing,.bottom], padding)
                } else {
                    VStack(alignment: .leading){
                        Text(self.description).foregroundColor(Color.gray)
                        LazyVGrid(columns: defaultLayout) { listView }
                        .listStyle(PlainListStyle()).onAppear {
                            UITableView.appearance().separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: padding)
                        }
                    }.frame(maxWidth: .infinity, alignment: .leading).padding([.leading,.trailing,.bottom], padding)
                }
                if isLoading {
                    activityIndicator
                }
            }.navigationTitle(self.title)
        }.navigationViewStyle(StackNavigationViewStyle()) 
    
        }
    }

    private var activityIndicator: some View {
        ActivityIndicator(style: .medium).frame(idealWidth:.infinity, maxWidth: .infinity, alignment:.center)
    }

    private var listView: some View {
        ForEach(elements) { elem in
            RepoCell(item: elem).onAppear {
                if self.elements.last == elem {
                    self.scrolledToBottom()
                }
            }
            if !isiPad {
                Divider()
            }
        }
    }

}


