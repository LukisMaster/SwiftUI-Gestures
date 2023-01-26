//
//  MainView.swift
//  MyArcheryTargetsScorer
//
//  Created by Sergey Nestroyniy on 23.01.2023.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel : HomeViewModel
    
    var body: some View {
        NavigationView{
            VStack{
                
                // last trainings
                List{
                    ForEach(0..<20) { index in
                        NavigationLink("\(index + 1)) need core data") {
                            Text("\(index)) core data history sessions")
                        }
                    }
                }
                
                // main menu buttons
                ZStack {
                    Color(.sRGB, white: 0.7, opacity: 1)
                        .frame( idealHeight: 0)
                    VStack{
                        LazyVGrid(columns: viewModel.mainMenuGridColumns) {
                            ForEach (0..<4) { menuItemIndex in
                                NavigationLink {
                                    SessionSettingsView()
                                } label: {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 10)
                                            .foregroundColor(.white)
                                        VStack {
                                            Image(viewModel.menuLabelImages[menuItemIndex])
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 50, height: 50)
                                                .foregroundColor(.white)
                                            Text(viewModel.menuLabelTexts[menuItemIndex])
                                                .fontWeight(.bold)
                                        }
                                    }
                                    .frame(height: 100)
                                }
                            }

                        }

                    }
                    .padding()
                }
            }
            .navigationTitle("My Targets Scorer")
            .navigationBarTitleDisplayMode(.inline)
        }
    }    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel())
    }
}
