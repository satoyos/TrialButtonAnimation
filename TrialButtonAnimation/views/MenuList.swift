import SwiftUI

struct MenuList {
    private let settings: Settings
    
    init(settings: Settings) {
        self.settings = settings
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
    
    private var navLinkToSecTimerWithButton: NavigationLink<MenuRow, SecTimerWithButton> {
        NavigationLink(
            destination: SecTimerWithButton(startTime: Double(settings.interval)),
            label: {
                let item = MenuItem(title: "歌の間隔", value: Double(settings.interval))
                MenuRow(viewModel: .init(item: item))
            }
        )
    }
}

#Preview {
    MenuList(settings: Settings())
}

