import SwiftUI

struct AppsView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                Button {
                } label: {
                    HStack(spacing: 8) {
                        Image("Plus")
                            .renderingMode(.template)

                        Text("CREATE STATUS")
                    }
                    .foregroundColor(.brandPrimary)
                }

                VStack(spacing: 40) {
                    Row(
                        icon: "BusyStatusIcon",
                        name: "BUSY STATUS",
                        image: "BusyStatusImage"
                    )

                    Divider()
                        .background(.neutralQuinary)

                    Row(
                        icon: "PomodoroTimerIcon",
                        name: "POMODORO TIMER",
                        image: "PomodoroTimerImage"
                    )

                    Divider()
                        .background(.neutralQuinary)

                    Row(
                        icon: "WallpapersGifsIcon",
                        name: "WALLPAPERS & GIFS",
                        image: "WallpapersGifsImage"
                    )

                    Divider()
                        .background(.neutralQuinary)

                    Row(
                        icon: "ClockWeatherIcon",
                        name: "CLOCK & WEATHER",
                        image: "ClockWeatherImage"
                    )

                    Divider()
                        .background(.neutralQuinary)

                    Row(
                        icon: "InstagramStatsIcon",
                        name: "INSIGHT STATS",
                        image: "InstagramStatsImage"
                    )
                }
            }
            .padding(.horizontal, 14)
            .padding(.bottom, 40)
        }
        .background(.invertWhite)
    }

    struct Row: View {
        let icon: String
        let name: String
        let image: String

        var body: some View {
            VStack(spacing: 20) {
                HStack {
                    Image(icon)
                        .renderingMode(.template)
                        .foregroundColor(.invertBlack)

                    Text(name)
                        .foregroundColor(.invertBlack)
                        .font(.ppNeueMontrealRegular(size: 18))

                    Spacer()

                    HStack(spacing: 2) {
                        Text("CUSTOMIZE")
                            .font(.ppNeueMontrealRegular(size: 12))
                        Image("ChevronRegular")
                            .renderingMode(.template)
                    }
                    .foregroundColor(.neutralTertiary)
                }

                Image(image)
                    .resizable()
                    .scaledToFit()

                FilledButton("RUN APP") {
                }
            }
        }
    }
}

#Preview {
    MainView(initialTab: 2)
}
