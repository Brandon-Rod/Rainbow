//
//  ColorSquareView.swift
//  Rainbow
//
//  Created by Brandon Rodriguez on 11/29/22.
//

import SwiftUI

struct ColorSquareView: View {
    
    let color: String
    
    var body: some View {
        
        Color(color)
            .frame(width: 80, height: 80)
            .cornerRadius(10)
            .shadow(color: Color(color).opacity(0.8), radius: 5)
            .draggable(color)
        
    }
    
}

struct ColorSquareView_Previews: PreviewProvider {
    static var previews: some View {
        ColorSquareView(color: "Blue")
    }
}
