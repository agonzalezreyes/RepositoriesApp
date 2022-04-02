//
//  RepoCell.swift
//  Repositories
//
//  Created by Alejandrina Gonzalez Reyes on 3/31/22.
//

import SwiftUI

struct RepoCell: View {
    let item: RepositoryItem

    var body: some View {
        HStack {
            AsyncImage(url: URL(string: item.avatar_url)!) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit).clipShape(RoundedRectangle(cornerRadius: 15))
            } placeholder: {
                ProgressView()
            }.frame(maxWidth: UIScreen.screenWidth/3, maxHeight: UIScreen.screenWidth/3).scaledToFill()
            VStack(alignment: .leading, spacing: 8) {
                Text(item.name).font(.title3).fontWeight(.semibold)
                Text(item.login).font(.caption).foregroundColor(Color.gray)
            }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        }.frame(alignment: .topLeading)
    }
}

