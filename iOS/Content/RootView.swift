import SwiftUI

struct RootView: View {
    @AppStorage("isPaired") var isPaired: Bool = false

    var body: some View {
        if isPaired {
            DeviceView()
        } else {
            ConnectView()
        }
    }
}
