/*
 
 */

import SwiftUI
extension Color {
    static let lightPink = Color(red: 236 / 255, green: 188 / 255, blue: 180 / 255)
    static let lightGray = Color(red: 224 / 255, green: 229 / 255, blue: 236 / 255)
    static let lightOrange = Color(red: 219 / 255, green: 98 / 255, blue: 68 / 255)
    static let iconGray = Color(red: 112 / 255, green: 112 / 255, blue: 112 / 255)
    static let lighterPink = Color(red: 233 / 255, green: 219 / 255, blue: 210 / 255)
    static let lighterGray = Color(red: 214 / 255, green: 214 / 255, blue: 214 / 255)
    static let pinkColor = Color(red: 227 / 255, green: 133 / 255, blue: 180 / 255)
    static let purpleColor = Color(red: 123 / 255, green: 119 / 255, blue: 233 / 255)
    static let OrangeColor = Color(red: 240 / 255, green: 146 / 255, blue: 171 / 255)
}
struct ActivitesList: View {
    
    @State var small = true
    @Namespace var namespace
    
    var body: some View {
        NavigationView {
            HStack {
                ZStack {
                    // Background gradient
                    LinearGradient(gradient: Gradient(colors: [Color.pinkColor, Color.purpleColor]), startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea()
                    // Background Circles
                    VStack {
                        Capsule()
                            .fill(Color.OrangeColor)
                            .frame(width: 200, height: 200)
                            .offset(x: -150, y: -55)
                        Spacer()
                        Capsule()
                            .fill(Color.OrangeColor)
                            .frame(width: 200, height: 200)
                            .offset(x: 150, y: 105)
                    }
                    // Actual Scrollview
                    ScrollView {
                        VStack {
                            ForEach(activities, id: \.self) { activity in
                                NavigationLink(destination: ActivitiesDetails(activity: activity)) {
                                    ActivitiesRow(activity: activity)
                                }
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .navigationTitle("Activities")
                }
            }
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ActivitesList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) { deviceName in
            ActivitesList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
        .preferredColorScheme(.dark)
    }
}
