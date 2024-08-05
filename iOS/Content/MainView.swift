import SwiftUI

struct MainView: View {
    @State private var selectedTab = 0

    private let initialTab: Int

    init(initialTab: Int = 0) {
        self.initialTab = initialTab
    }

    var body: some View {
        TabView(selection: $selectedTab) {
            Group {
                LoginView()
                    .tabItem {
                        Image(.loginTab)
                            .renderingMode(.template)
                    }
                    .tag(0)

                DeviceView()
                    .tabItem {
                        Image(.deviceTab)
                            .renderingMode(.template)
                    }
                    .tag(1)

                AppsView() 
                    .tabItem {
                        Image(.appsTab)
                            .renderingMode(.template)
                    }
                    .tag(2)
            }
            .padding(.top, 4)
            .toolbarBackground(.backgroundTertiary, for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
        }
        .accentColor(.primary)
        .task {
            selectedTab = initialTab
        }
    }
}

#Preview {
    MainView()
}
