import Foundation

@MainActor
class Device: ObservableObject {
    enum PowerState {
        case on
        case off
    }

    enum BluetoothState {
        case connected
        case connecting
        case disconnected
    }

    enum WiFiState {
        case connected
        case connecting
        case disconnected
    }

    enum SoundState {
        case on
        case off
    }

    struct DeviceInfo {
        let firmwareVersion: String
        let serialNumber: String
        let devMode: String
    }

    @Published var powerState: PowerState = .off
    @Published var bluetoothState: BluetoothState = .disconnected
    @Published var wifiState: WiFiState = .disconnected
    @Published var soundState: SoundState = .on
    @Published var deviceInfo: DeviceInfo? = nil

    var isConnected: Bool {
        bluetoothState == .connected || wifiState == .connected
    }

    init() {
        Task {
            try await turnOn()
        }
    }

    func turnOn() async throws {
        powerState = .on
        Task { try await connectBluetooth() }
        Task { try await connectWiFi() }
    }

    func turnOff() async throws {
        try await disconnectBluetooth()
        try await disconnectWiFi()
        powerState = .off
    }

    func connectBluetooth() async throws {
        bluetoothState = .connecting
        try await Task.sleep(for: .seconds(1))
        self.bluetoothState = .connected
        try await self.updateDeviceInfo()
    }

    func connectWiFi() async throws {
        wifiState = .connecting
        try await Task.sleep(for: .seconds(1))
        self.wifiState = .connected
        try await self.updateDeviceInfo()
    }

    func disconnectBluetooth() async throws {
        bluetoothState = .disconnected
        try await self.updateDeviceInfo()
    }

    func disconnectWiFi() async throws {
        wifiState = .disconnected
        try await self.updateDeviceInfo()
    }

    func toggleMute() async throws {
        switch soundState {
        case .on: soundState = .off
        case .off: soundState = .on
        }
    }

    func updateDeviceInfo() async throws {
        guard isConnected else {
            deviceInfo = nil
            return
        }
        deviceInfo = .init(
            firmwareVersion: "BSB_OR1.5",
            serialNumber: "127.12.0",
            devMode: "Off"
        )
    }

    func reboot() async throws {
        try await turnOff()
        try await Task.sleep(for: .seconds(2))
        try await turnOn()
    }
}
