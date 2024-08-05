import SwiftUI

struct FilledButton: View {
    let text: String
    let action: () -> Void

    init(_ text: String, action: @escaping () -> Void) {
        self.text = text
        self.action = action
    }

    var body: some View {
        Button {
            action()
        } label: {
            HStack {
                Spacer()
                Text(text)
                    .font(.ppNeueMontrealRegular(size: 16))
                    .foregroundColor(.white)
                    .padding(.vertical, 14)
                Spacer()
            }
            .background(.accent)
            .cornerRadius(8)
        }
    }
}
