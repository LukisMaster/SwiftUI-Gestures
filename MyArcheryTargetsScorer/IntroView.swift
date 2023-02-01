// просто тестовое вью, можно делать что хочешь

import SwiftUI

struct IntroView: View {
    @State var selection = "Green"
    let selectionOptions = ["Green", "Blue", "Red"]
    
    init() {
       // UISegmentedControl.appearance().selectedSegmentTintColor = UIColor.red
    }
    
    var body: some View {
        
        ZStack {
            RadialGradient(
                gradient: Gradient(colors: [Color(#colorLiteral(red: 0.476841867, green: 0.5048075914, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0.3236978054, green: 0.1063579395, blue: 0.574860394, alpha: 1))]),
                center: .topLeading,
                startRadius: 5,
                endRadius: UIScreen.main.bounds.height
            )
            .ignoresSafeArea()
            
            HStack {
                Picker("My Picker", selection: $selection) {
                    ForEach(selectionOptions, id: \.self) { option in
                        
                        Text(option)
                            .tag(option)

                    }

                }
                .pickerStyle(.segmented)
                .frame(width: 200, alignment: .leading)
                
                Spacer()
            }
        }
        
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
    }
}
