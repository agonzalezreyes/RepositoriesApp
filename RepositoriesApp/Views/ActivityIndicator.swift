//
//  ActivityIndicator.swift
//  Repositories
//
//  Created by Alejandrina Gonzalez Reyes on 4/1/22.
//

import UIKit
import SwiftUI

struct ActivityIndicator: UIViewRepresentable {
    let style: UIActivityIndicatorView.Style
    
    func makeUIView(context: Context) -> some UIView {
        let activityIndicator = UIActivityIndicatorView(style: style)
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        return activityIndicator
    }

    // declare to conform to UIViewRepresentable
    func updateUIView(_ uiView: UIViewType, context: Context) {}
}
