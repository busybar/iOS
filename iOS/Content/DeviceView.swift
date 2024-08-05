import SwiftUI

struct DeviceView: View {
    var body: some View {
        ZStack {
            Text("DeviceView")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    MainView(initialTab: 1)
}
