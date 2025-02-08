import SwiftUI
import Combine

struct MenuList {
    @ObservedObject private var settings: Settings
    private var cancellables = Set<AnyCancellable>()
    
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
                navLinkToInterPoemDurationSetting
                NavLinkToKamiShimoDurationSetting
                NavLinkToVolumeSetting
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
    
    private var navLinkToInterPoemDurationSetting: NavigationLink<MenuRow, InterPoemDurationSetting> {
        NavigationLink(
            destination: InterPoemDurationSetting(settings: settings),
            label: {
                let item = MenuItem(title: "歌の間隔", value: Double(settings.interval))
                MenuRow(viewModel: .init(item: item))
            }
        )
    }
    
    private var NavLinkToKamiShimoDurationSetting: NavigationLink<MenuRow, KamiShimoDurationSetting> {
        NavigationLink(
            destination: KamiShimoDurationSetting(  settings: settings),
            label: {
                let item = MenuItem(title: "上の句と下の句の間隔", value: Double(settings.kamiShimoInterval))
                MenuRow(viewModel: .init(item: item))
            })
    }
  
  private var NavLinkToVolumeSetting: NavigationLink<MenuRow, VolumeSetting> {
    NavigationLink(
      destination: VolumeSetting(                settings: settings),
      label: {
        let item = MenuItem(title: "音量調整", value: Double(settings.volume))
        MenuRow(viewModel: .init(item: item))
      })
  }
}

#Preview {
    MenuList(settings: Settings())
}

