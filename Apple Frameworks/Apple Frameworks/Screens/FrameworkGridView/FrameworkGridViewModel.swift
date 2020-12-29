//
//  FrameworkGridViewModel.swift
//  Apple-Framework-SeanAllen
//
//  Created by Felix Leitenberger on 08.11.20.
//

import SwiftUI

final class FrameworkGridViewModel: ObservableObject {
    
    let columns: [GridItem] = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var selectedFramework: Framework? {
        didSet { isShowingDetailView = true }
    }
    
    @Published var isShowingDetailView = false
}
