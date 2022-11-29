//
//  CorrectAnswerView.swift
//  Rainbow
//
//  Created by Brandon Rodriguez on 11/29/22.
//

import SwiftUI

struct CorrectAnswerView: View {
    
    @Binding var isShowingOverlay: Bool
    @Binding var colors: [String]
    
    var body: some View {
        
        VStack(spacing: 20) {
            
            Text("Correct! You matched the rainbow")
                .font(.title2)
                .foregroundStyle(LinearGradient(colors: [Color("Red"), Color("Orange"), Color("Yellow"), Color("Green"), Color("Blue"), Color("Purple")], startPoint: .leading, endPoint: .trailing))
            
            Button {
                
                colors.shuffle()
                isShowingOverlay = false
                
            } label: {
                
                RainbowButtonView(title: "Restart")
                
            }

        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(.thinMaterial)
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.8), radius: 5)
        
    }
    
}

struct CorrectAnswerView_Previews: PreviewProvider {
    static var previews: some View {
        CorrectAnswerView(isShowingOverlay: .constant(true), colors: .constant([""]))
    }
}
