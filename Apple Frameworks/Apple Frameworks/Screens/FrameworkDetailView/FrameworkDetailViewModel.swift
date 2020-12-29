//
//  FrameworkDetailViewModel.swift
//  Apple-Framework-SeanAllen
//
//  Created by Felix Leitenberger on 18.12.20.
//

import SwiftUI

final class FrameworkDetailViewModel: ObservableObject {
    
    var framework: Framework
    var isShowingDetailView: Binding<Bool>
    @Published var isShowingSafariView = false
    
    init(framework: Framework, isShowingDetailView: Binding<Bool>) {
        self.framework = framework
        self.isShowingDetailView = isShowingDetailView
    }
}


