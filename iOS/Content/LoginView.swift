import SwiftUI

struct LoginView: View {
    @State var email: String = ""
    @State var password: String = ""

    var body: some View {
        VStack(spacing: 0) {
            Image(.cloud)

            Spacer()

            VStack(spacing: 24) {
                VStack(spacing: 12) {
                    EmailField(value: $email)
                    PasswordField(value: $password)
                }
                .font(.jetBrainsMonoRegular(size: 16))

                HStack {
                    Spacer()
                    Button {
                    } label: {
                        Text("Forgot Password?")
                            .font(.system(size: 18, weight: .regular))
                    }
                }

                FilledButton("LOGIN") {
                }
            }

            VStack(spacing: 18) {
                HStack(alignment: .center, spacing: 12) {
                    HorizontalLine()
                        .foregroundStyle(.neutralQuinary)

                    Text("Or Login with")
                        .font(.system(size: 18, weight: .regular))
                        .foregroundStyle(.neutralTertiary)
                        .layoutPriority(.infinity)

                    HorizontalLine()
                        .foregroundStyle(Color(.systemGray6))
                }
                .padding(.top, 57)

                HStack(spacing: 12) {
                    Button {
                    } label: {
                        LogoContainer {
                            Image(.appleLogo)
                        }
                    }

                    Button {
                    } label: {
                        LogoContainer {
                            Image(.googleLogo)
                        }
                    }
                }
            }

            HStack {
                Text("Don’t have an account?")
                    .font(.system(size: 18, weight: .regular))
                    .foregroundStyle(.neutralTertiary)

                Button {
                } label: {
                    Text("SIGN UP")
                        .foregroundStyle(.brandPrimary)
                }
            }
            .padding(.vertical, 46)
        }
        .padding(.horizontal, 24)
    }

    struct HorizontalLine: View {
        var body: some View {
            Rectangle()
                .frame(height: 1)
        }
    }

    struct LogoContainer: View {
        @ViewBuilder var content: () -> Image

        var body: some View {
            VStack {
                content()
            }
            .frame(minHeight: 60)
            .frame(maxWidth: .infinity)
            .background(.blackTertiary)
            .cornerRadius(4)
        }
    }

    struct EmailField: View {
        @Binding var value: String

        var body: some View {
            TextField(
                "",
                text: $value,
                prompt: Text("Email").foregroundColor(.neutralSecondary)
            )
            .textFieldStyle
        }
    }

    struct PasswordField: View {
        @Binding var value: String

        var body: some View {
            SecureField(
                "",
                text: $value,
                prompt: Text("Password").foregroundColor(.neutralSecondary)
            )
            .textFieldStyle
        }
    }

}

private extension View {
    var textFieldStyle: some View {
        self
            .padding(.horizontal, 12)
            .padding(.vertical, 14)
            .background(.blackQuaternary)
            .cornerRadius(8)
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(.blackSecondary)
            }
    }
}

#Preview {
    MainView()
}
