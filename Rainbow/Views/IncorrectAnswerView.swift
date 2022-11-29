//
//  IncorrectAnswerView.swift
//  Rainbow
//
//  Created by Brandon Rodriguez on 11/29/22.
//

import SwiftUI

struct IncorrectAnswerView: View {
    
    @Binding var isShowingOverlay: Bool
    
    var body: some View {
        
        VStack(spacing: 20) {
            
            Text("Incorrect Order")
                .font(.title2)
            
            Button { isShowingOverlay = false } label: {
                
                RainbowButtonView(title: "Try Again")
                
            }

        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(.thinMaterial)
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.8), radius: 5)
        
    }
    
}

struct IncorrectAnswerView_Previews: PreviewProvider {
    static var previews: some View {
        IncorrectAnswerView(isShowingOverlay: .constant(true))
    }
}
