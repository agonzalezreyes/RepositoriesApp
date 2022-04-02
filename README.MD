# iOS Github Repositories App

## Description
An iOS 15 app that fetches all public repositories from [Github's REST API](https://docs.github.com/en/rest). The app fetches 10 repositories at a time, by using `per_page` and `page` parameters provided by the [Search API](https://docs.github.com/en/rest/reference/search), and uses infinite scrolling with a [UIActivityIndicatorView](https://developer.apple.com/documentation/uikit/uiactivityindicatorview/) to indicate that it is fetching the next batch of repositories. Repositories are displayed using [ScrollView](https://developer.apple.com/documentation/swiftui/scrollview/) and [LazyVGrid](https://developer.apple.com/documentation/swiftui/lazyvgrid/). Each repository includes the repository name, owner, and profile image (avatar_url) of the owner. Each image is loaded asynchronously and displayed with [AsyncImage](https://developer.apple.com/documentation/swiftui/asyncimage).

## Previews
<img src="images/iphone.gif" alt="iPhone App" title="iPhone App" width="250"/>
<img src="images/ipad.gif" alt="iPad App" title="iPad App" width="450"/>

## Notes
* This was my first time developing an app with SwiftUI -- it was fun learning how it works. I thought this project would be a great opportunity to use it.
* Would definitely improve the UI/UX and add some extra features if I had more time, such as: looking up the repositories of a certain user or with certain keywords with the use of a search bar; adding a favorites list, having a details view when you tap on a repository cell, making the file `API.swift` more flexible to support different HTTP requests, etc. 
* A potential issue of the implementation that can be improved is how the UIDevice Idiom is checked and used to adjust the contents of `ElementsListView.swift` -- I was not sure what was the best way to handle different displays (one column for iPhone vs two columns for iPad) with SwiftUI. Also, some of the SwiftUI code could be refactored and improved in general.

