//
//  AppSettingsView.swift
//  MyArcheryTargetsScorer
//
//  Created by Sergey Nestroyniy on 27.01.2023.
//

import SwiftUI

struct AppSettingsView: View {
    @EnvironmentObject var appTheme : AppColorTheme
    @StateObject var viewModel : AppSettingsViewModel
    var dateFormatter : DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }
    
    var body: some View {
        VStack(spacing: 0) {
            List {
                Section {
                    ListTextFieldView(title: "First name: ", text: $viewModel.firstName)
                        .foregroundColor(appTheme.text)
                    ListTextFieldView(title: "Last name: ", text: $viewModel.lastName)
                        .foregroundColor(appTheme.text)
                    DatePicker(
                        "Birthday: ",
                        selection: $viewModel.birthday,
                        in: ...Date(),
                        displayedComponents: [.date]
                    )
                    .foregroundColor(appTheme.text)
                    ListTextFieldView(title: "Club:", text: $viewModel.club)
                        .foregroundColor(appTheme.text)
                } header: {
                    HStack {
                        Text("User Profile")
                            .font(.headline)
                            .foregroundColor(appTheme.text)
                            .padding()
                        Spacer()
                    }
                    .background(appTheme.accent)
                    .listRowInsets(EdgeInsets(
                        top: 0,
                        leading: 0,
                        bottom: 0,
                        trailing: 0))
                }
                .listRowBackground(appTheme.background)

                
                Section {
                    HStack {
                        Text("Main color")
                            .foregroundColor(appTheme.text)
                        Picker(selection: $appTheme.colorThemePickerIndex) {
                            ForEach(0..<appTheme.appThemesCount, id: \.self) { index in
                                Text(appTheme.appThemeNames[index])
                                    .tag(index)
                            }
                        } label: {
                            Text("Color Theme")
                        }
                        .pickerStyle(.segmented)
                        .colorMultiply(appTheme.accent)
                    }
                } header: {
                    HStack {
                        Text("Color Theme")
                            .font(.headline)
                            .foregroundColor(appTheme.text)
                            .padding()
                        Spacer()
                    }
                    .background(appTheme.accent)
                    .listRowInsets(EdgeInsets(
                        top: 0,
                        leading: 0,
                        bottom: 0,
                        trailing: 0))
                    
                }
                .listRowBackground(appTheme.background)

                
            }
            .listStyle(.plain)

        }
        .customNavigationTitle("App settings")
    }
        
    
}

struct AppSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavView {
            AppSettingsView(viewModel: AppSettingsViewModel())
        }
    }
}

// MARK: - ListTextFieldView

struct ListTextFieldView: View {
    let title: String
    @Binding var text: String
    
    var body: some View {
        HStack {
            Text(title)
            TextField(
                text,
                text: $text
            )
        }
    }
}
