import SwiftUI

struct LoginView: View {
    var body: some View {
        VStack(spacing: 0) {
            Image(.cloud)

            Spacer()

            VStack(spacing: 24) {
                VStack(spacing: 12) {
                    TextField("Email", text: .constant(""))
                        .textFieldStyle

                    SecureField("Password", text: .constant(""))
                        .textFieldStyle
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
                        .foregroundStyle(Color(.systemGray6))

                    Text("Or Login with")
                        .font(.system(size: 18, weight: .regular))
                        .foregroundStyle(Color(.systemGray2))
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
                    .foregroundStyle(Color(.systemGray2))

                Button {
                } label: {
                    Text("SIGN UP")
                        .foregroundStyle(.accent)
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
            .background(Color(.systemGray3))
            .cornerRadius(4)
        }
    }
}

private extension View {
    var textFieldStyle: some View {
        self
            .padding(.horizontal, 12)
            .padding(.vertical, 14)
            .background(Color(.systemGray6))
            .cornerRadius(8)
    }
}

#Preview {
    MainView()
}
