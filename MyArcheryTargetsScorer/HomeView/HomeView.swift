//
//  MainView.swift
//  MyArcheryTargetsScorer
//
//  Created by Sergey Nestroyniy on 23.01.2023.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var viewModel : HomeViewModel
    
    var body: some View {
        VStack{
            
            // last trainings
            List{
                ForEach(0..<20) { index in
                    SessionRowView()
                        .listRowInsets(.init(top: 10, leading: 5, bottom: 10, trailing: 5))
                }
                .listRowBackground(Color.appTheme.background)
                
            }
            .listStyle(PlainListStyle())
            .background(Color.appTheme.background)
            
            // main menu buttons
            LazyVGrid(columns: viewModel.mainMenuGridColumns) {
                ForEach (0..<4) { menuItemIndex in
                    NavigationLink {
                        viewModel.presentView(menuIndex: menuItemIndex)
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color.appTheme.accent)
                            VStack {
                                Image(viewModel.menuLabelImages[menuItemIndex])
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                                    .foregroundColor(.white)
                                Text(viewModel.menuLabelTexts[menuItemIndex])
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.appTheme.text)
                            }
                        }
                        .frame(height: 100)
                    }
                }
                
            }
            .padding()
            .background(Color.appTheme.background)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .previewDevice("iPhone 11")
            .environmentObject(HomeViewModel())
    }
}
