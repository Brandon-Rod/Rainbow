//
//  RainbowButtonView.swift
//  Rainbow
//
//  Created by Brandon Rodriguez on 11/29/22.
//

import SwiftUI

struct RainbowButtonView: View {
    
    let title: String
    
    var body: some View {
        
        Text(title)
            .font(.title3)
            .foregroundColor(.white)
            .padding(10)
            .frame(maxWidth: .infinity)
            .background(.blue)
            .cornerRadius(10)
            .shadow(color: .black.opacity(0.8), radius: 5)
        
    }
    
}

struct RainbowButtonView_Previews: PreviewProvider {
    static var previews: some View {
        RainbowButtonView(title: "Submit")
    }
}
