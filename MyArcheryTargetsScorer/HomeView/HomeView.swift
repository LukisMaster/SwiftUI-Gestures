//
//  MainView.swift
//  MyArcheryTargetsScorer
//
//  Created by Sergey Nestroyniy on 23.01.2023.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var appTheme : AppColorThemeViewModel
    @StateObject var viewModel : HomeViewModel
    
    var body: some View {
        VStack(spacing: 0){
            
            // last trainings
            List{
                ForEach(0..<20) { index in
                        SessionRowView()
                            .listRowInsets(.init(top: 10, leading: 5, bottom: 10, trailing: 5))
                            .overlay(CustomNavLink(destination:
                                                    Text("Shooting Session number \(index)")
                                                        .customNavigationTitle("Shooting Session \(index)")
                                                  ) {
                                EmptyView()
                            })
                }
                .listRowBackground(appTheme.background)
                
            }
            .listStyle(.plain)
            .background(appTheme.background)
            
            Divider()
            
            // main menu buttons
            LazyVGrid(columns: viewModel.mainMenuGridColumns) {
                
                ForEach (0..<4) { menuItemIndex in
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(appTheme.accent)
                        VStack {
                            Image(viewModel.menuLabelImages[menuItemIndex])
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                            Text(viewModel.menuLabelTexts[menuItemIndex])
                                .fontWeight(.bold)
                                .foregroundColor(appTheme.text)
                        }
                    }
                    .frame(height: 100)
                    .overlay(CustomNavLink(destination:
                                            viewModel.presentView(menuIndex: menuItemIndex)
                                          ) {
                        Color.clear
                    })
                }
                
            }
            .padding()
            .background(
                appTheme.background
                    .ignoresSafeArea()
            )
        }
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavView{
            HomeView(viewModel: HomeViewModel())
        }
        .environmentObject(AppColorThemeViewModel())
        .previewDevice("iPhone 11")
    }
}
