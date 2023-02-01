//
//  AppSettingsView.swift
//  MyArcheryTargetsScorer
//
//  Created by Sergey Nestroyniy on 27.01.2023.
//

import SwiftUI

struct AppSettingsView: View {
    @StateObject var viewModel : AppSettingsViewModel
    var dateFormatter : DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }
    
    var body: some View {
        VStack {
            List {
                Section {
                    ListTextFieldView(title: "First name: ", text: $viewModel.firstName)
                    ListTextFieldView(title: "Last name: ", text: $viewModel.lastName)
                    DatePicker(
                        "Birthday: ",
                        selection: $viewModel.birthday,
                        in: ...Date(),
                        displayedComponents: [.date]
                    )
                    ListTextFieldView(title: "Club:", text: $viewModel.club)
                } header: {
                    Text("User Profile")
                }

                Section {
                    HStack {
                        Text("Main color")
                        Picker("Color Theme", selection: $viewModel.selectedColorScheme) {
                            ForEach(viewModel.colorSchemes, id: \.self) { option in
                                Text(option.rawValue)
                                    .tag(option)
                            }
                        }
                        .pickerStyle(.segmented)
                        Spacer()
                    }
                } header: {
                    Text("Color Theme")
                }

            }
        }
        .navigationTitle("App settings")
    }
}

struct AppSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AppSettingsView(viewModel: AppSettingsViewModel())
                .navigationBarTitleDisplayMode(.inline)
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
