import SwiftUI
import Combine

struct MenuList {
    @ObservedObject private var settingsWrapper: SettingsPublishingWrapper
    private var cancellables = Set<AnyCancellable>()
    
    init(settings: Settings) {
        self.settingsWrapper = SettingsPublishingWrapper(settings: settings)
        
    }
}

extension MenuList: View {

    var body: some View {
        List {
            // 複雑なことはやめて、メニューの中身はここに書く！
            Section(header: Text("画面")) {
                navLinkToMemorizeTimer
                navLinkToSecTimerWithButton
            }
        }
    }
    
    private var navLinkToMemorizeTimer: NavigationLink<MenuRow, MemorizeTimer> {
        NavigationLink(
            destination: MemorizeTimer(viewModel: .init(minutes: 3)),
            label: {
                let item = MenuItem(title: "暗記時間タイマー")
                MenuRow(viewModel: .init(item: item))
            }
        )
    }
    
    private var navLinkToSecTimerWithButton: NavigationLink<MenuRow, DurationSetting> {
        NavigationLink(
            destination: DurationSetting(startTime: Double(settingsWrapper.interval), settingsWrapper: settingsWrapper),
            label: {
                let item = MenuItem(title: "歌の間隔", value: Double(settingsWrapper.interval))
                MenuRow(viewModel: .init(item: item))
            }
        )
    }
}

#Preview {
    MenuList(settings: Settings())
}

