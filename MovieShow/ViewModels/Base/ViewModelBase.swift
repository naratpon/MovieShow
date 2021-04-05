//
//  ViewModelBase.swift
//  MovieShow
//
//  Created by Naratpon Buakhaw on 5/4/2564 BE.
//

import Foundation

enum LoadingState {
    case loading, success, failed, none
}

class ViewModelBase: ObservableObject {
    @Published var loadingState: LoadingState = .none
}
