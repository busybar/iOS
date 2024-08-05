import SwiftUI

struct DeviceView: View {
    var body: some View {
        VStack {
            Image("BusyBar")
                .resizable()
                .scaledToFit()

            FilledButton {
            } label: {
                HStack(spacing: 2) {
                    Text("CHANGE APP")
                    Image("Chevron")
                }
            }

            Spacer()
        }
        .padding(.top, 26)
        .padding(.horizontal, 14)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    MainView(initialTab: 1)
}
