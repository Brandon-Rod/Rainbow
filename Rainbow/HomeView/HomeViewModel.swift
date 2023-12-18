//
//  HomeViewModel.swift
//  Rainbow
//
//  Created by Brandon Rodriguez on 11/29/22.
//

import SwiftUI

final class HomeViewModel: ObservableObject {
    
    @Published var colors = ["Red", "Orange", "Yellow", "Green", "Blue", "Purple"].shuffled()
    @Published var rainbowCorrect = false
    @Published var isShowingOverlay = false
    
    let correctOrder = ["Red", "Orange", "Yellow", "Green", "Blue", "Purple"]
    let columns: [GridItem] = [
        
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
        
    ]
    
    func rainbow() {
        
        rainbowCorrect = true
        isShowingOverlay = true
    }
    
    func incorrectRainbow() {
        
        rainbowCorrect = false
        isShowingOverlay = true
        
    }
    
}
