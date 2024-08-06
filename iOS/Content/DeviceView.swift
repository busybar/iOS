import SwiftUI

struct DeviceView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                Image("BusyBar")
                    .resizable()
                    .scaledToFit()

                FilledButton {
                    print("change app tapped")
                } label: {
                    HStack(spacing: 2) {
                        Text("CHANGE APP")
                        Image("Chevron")
                    }
                }
                .padding(.top, 18)

                VStack(spacing: 8) {
                    GrayButton("TURN OFF") {
                        print("turn off tapped")
                    }

                    HStack(spacing: 8) {
                        GrayButton("MUTE") {
                            print("mute tapped")
                        }
                        GrayButton("REBOOT") {
                            print("reboot tapped")
                        }
                        GrayButton {
                            print("x tapped")
                        } label: {
                            Image("Settings")
                        }
                    }
                }
                .padding(.top, 24)

                HStack(spacing: 8) {
                    GrayButton {
                        print("wifi tapped")
                    } label: {
                        HStack(spacing: 6) {
                            Image("WiFi")
                            VStack(alignment: .leading, spacing: 4) {
                                Text("WIFI")
                                    .font(.ppNeueMontrealRegular(size: 10))
                                    .foregroundStyle(.invertBlack)

                                Text("CONNECTED")
                                    .font(.ppNeueMontrealRegular(size: 14))
                                    .foregroundStyle(.wiFiPrimary)
                            }
                            Image("ChevronRegular")
                        }
                        .frame(height: 66)
                    }

                    GrayButton {
                        print("bluetooth tapped")
                    } label: {
                        HStack(spacing: 6) {
                            Image("Bluetooth")
                            VStack(alignment: .leading, spacing: 4) {
                                Text("BLUETOOTH")
                                    .font(.ppNeueMontrealRegular(size: 10))
                                    .foregroundStyle(.invertBlack)

                                Text("CONNECTED")
                                    .font(.ppNeueMontrealRegular(size: 14))
                                    .foregroundStyle(.bluetoothPrimary)
                            }
                            Image("ChevronRegular")
                        }
                        .frame(height: 66)
                    }
                }
                .padding(.top, 40)

                VStack(spacing: 12) {
                    HStack {
                        Text("ABOUT DEVICE")
                            .font(.ppNeueMontrealRegular(size: 12))
                            .foregroundStyle(.neutralTertiary)
                        Spacer()
                    }

                    StrokedButton {

                    } label: {
                        HStack(spacing: 4) {
                            Text("UPDATE FIRMWARE")
                            Image("Chevron")
                                .renderingMode(.template)
                        }
                        .foregroundColor(.brandPrimary)
                    }

                    DeviceInfo()
                        .padding(.vertical, 24)
                }
                .padding(.top, 40)
                .frame(maxWidth: .infinity)
            }
            .padding(.top, 26)
            .padding(.horizontal, 14)
        }
    }

    struct DeviceInfo: View {
        var body: some View {
            VStack(spacing: 24) {
                Line(name: "Firmware version", value: "BSB_OR1.5")
                Divider()
                    .background(.neutralQuinary)
                Line(name: "Dev mode", value: "Off")
                Divider()
                    .background(.neutralQuinary)
                Line(name: "Serial Number", value: "127.12.0")
            }
        }

        struct Line: View {
            let name: String
            let value: String

            var body: some View {
                HStack {
                    Text(name)
                        .foregroundStyle(.invertBlack)
                    Spacer()
                    Text(value)
                        .foregroundStyle(.neutralSecondary)
                }
                .font(.jetBrainsMonoRegular(size: 16))
            }
        }
    }
}

#Preview {
    MainView(initialTab: 1)
}
