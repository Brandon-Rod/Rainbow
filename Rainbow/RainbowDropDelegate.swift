//
//  RainbowDropDelegate.swift
//  Rainbow
//
//  Created by Brandon Rodriguez on 11/29/22.
//

import SwiftUI

struct RainbowDropDelegate: DropDelegate {
    
    let color: String
    
    @Binding var colors: [String]
    @Binding var draggedColor: String?
    
    func performDrop(info: DropInfo) -> Bool {
        
        return true
        
    }
    
    func dropEntered(info: DropInfo) {
        
        guard let draggedColor = self.draggedColor else { return }
        
        if draggedColor != color {
            
            let from = colors.firstIndex(of: draggedColor)!
            let to = colors.firstIndex(of: color)!
            
            self.colors.move(fromOffsets: IndexSet(integer: from), toOffset: to > from ? to + 1 : to)
            
        }
        
    }
    
}
