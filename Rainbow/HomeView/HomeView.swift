//
//  ContentView.swift
//  Rainbow
//
//  Created by Brandon Rodriguez on 11/29/22.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        
        NavigationView {
            
            VStack(alignment: .leading, spacing: 20) {
                
                Text("Drag and drop the colors from left to right to match the rainbow.")
                    .font(.title2)
                
                Spacer()
                
                LazyVGrid(columns: viewModel.columns, spacing: 20) {
                    
                    ForEach(viewModel.colors, id: \.self) { color in
                        
                        ColorSquareView(color: color)
                            .onDrag({

                                viewModel.draggedColor = color
                                return NSItemProvider(item: nil, typeIdentifier: color)

                            })
                            .onDrop(of: [.text], delegate: RainbowDropDelegate(color: color, colors: $viewModel.colors, draggedColor: $viewModel.draggedColor))
                        
                    }
                    
                }
                
                Spacer()
                
                Button { viewModel.colors.shuffle() } label: {
                    
                    RainbowButtonView(title: "Shuffle")
                    
                }
                
                Button {
                    
                    if viewModel.colors == viewModel.correctOrder {
                        
                        viewModel.rainbowCorrect = true
                        viewModel.isShowingOverlay = true
                        
                    } else {
                        
                        viewModel.rainbowCorrect = false
                        viewModel.isShowingOverlay = true
                        
                    }
                    
                } label: {
                    
                    RainbowButtonView(title: "Submit")
                    
                }
                
            }
            .navigationTitle("Rainbow")
            .padding()
            .disabled(viewModel.isShowingOverlay)
            .blur(radius: viewModel.isShowingOverlay ? 10 : 0)
            .animation(.easeInOut, value: viewModel.colors)
            .animation(.easeInOut, value: viewModel.isShowingOverlay)
            .overlay {
                
                if viewModel.isShowingOverlay {
                    
                    if viewModel.rainbowCorrect {
                        
                        CorrectAnswerView(isShowingOverlay: $viewModel.isShowingOverlay, colors: $viewModel.colors)
                            .padding()
                        
                    } else {
                        
                        IncorrectAnswerView(isShowingOverlay: $viewModel.isShowingOverlay)
                            .padding()
                        
                    }
                    
                }
                
            }
            
        }
        
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
