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
        navLinkFiveColorsPicker
        navLinkToMemorizeTimer
        navLinkToInterPoemDurationSetting
        NavLinkToKamiShimoDurationSetting
        NavLinkToVolumeSetting
      }
    }
  }
  
  private var navLinkFiveColorsPicker: NavigationLink
  <MenuRow, FiveColorsView> {
    NavigationLink (
      destination: FiveColorsView(settings: settings),
      label: {
        let item = MenuItem(
          title: "五色百人一首の色で選ぶ",
          value: "\(settings.state100.selectedNum)首")
          MenuRow(viewModel: .init(item: item))
      })
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
                let item = MenuItem(title: "歌の間隔", value: String(format: "%.2F", settings.interval) + "秒")
                MenuRow(viewModel: .init(item: item))
            }
        )
    }
    
    private var NavLinkToKamiShimoDurationSetting: NavigationLink<MenuRow, KamiShimoDurationSetting> {
        NavigationLink(
            destination: KamiShimoDurationSetting(  settings: settings),
            label: {
                let item = MenuItem(
                  title: "上の句と下の句の間隔",
                  value: String(format: "%.2F", settings.kamiShimoInterval) + "秒")
                MenuRow(viewModel: .init(item: item))
            })
    }
  
  private var NavLinkToVolumeSetting: NavigationLink<MenuRow, VolumeSetting> {
    NavigationLink(
      destination: VolumeSetting(settings: settings),
      label: {
        let item = MenuItem(
          title: "音量調整",
          value: "\(Int(settings.volume * 100))%")
        MenuRow(viewModel: .init(item: item))
      })
  }
}

#Preview {
    MenuList(settings: Settings())
}

