//
//  ViewExtensions.swift
//  MovieShow
//
//  Created by Naratpon Buakhaw on 2/4/2564 BE.
//

import Foundation
import SwiftUI

extension View {
    func embedNavigationView() -> some View {
        return NavigationView { self }
    }
}
