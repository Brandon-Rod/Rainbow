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
                
                InstructionsView()
                
                Spacer()
                
                LazyVGrid(columns: viewModel.columns, spacing: 20) {
                    
                    ForEach(viewModel.colors, id: \.self) { color in
                        
                        ColorSquareView(color: color)
                            .dropDestination(for: String.self) { droppedTask, _ in

                                let draggedColor = droppedTask.first!
                                let from = viewModel.colors.firstIndex(of: draggedColor)
                                let to = viewModel.colors.firstIndex(of: color)
                                viewModel.colors.move(fromOffsets: IndexSet(integer: from!), toOffset: (to! > from! ? to! + 1 : to)!)
                                
                                return true
                                
                            }
                            
                    }
                    
                }
                
                Spacer()
                
                Button { viewModel.colors.shuffle() } label: {
                    
                    RainbowButtonView(title: "Shuffle")
                    
                }
                
                Button {
                    
                    if viewModel.colors == viewModel.correctOrder {
                        
                        viewModel.rainbow()
                        
                    } else {
                        
                        viewModel.incorrectRainbow()
                        
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
