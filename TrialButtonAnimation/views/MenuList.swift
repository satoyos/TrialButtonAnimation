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
    NavigationStack {
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
      .navigationBarTitle("トップ")
    }
  }
  
  typealias ModifiedNavLink<Label: View, Modifier: ViewModifier> = ModifiedContent<NavigationLink<MenuRow, Label>, Modifier>

  private var navLinkFiveColorsPicker: ModifiedNavLink<some View, some ViewModifier>{
    let title = "五色百人一首の色で選ぶ"
    return NavigationLink (
      destination: FiveColorsView(settings: settings),
      label: {
        let item = MenuItem(
          title: title,
          value: "\(settings.state100.selectedNum)首")
          MenuRow(viewModel: .init(item: item))
      })
    .accessibilityIdentifier(title)
  }
  
    
  private var navLinkToMemorizeTimer: ModifiedNavLink<some View, some ViewModifier> {
    let title = "暗記時間タイマー"
    return NavigationLink(
      destination: MemorizeTimer(viewModel: .init(minutes: 3)),
      label: {
        let item = MenuItem(title: title)
        MenuRow(viewModel: .init(item: item))
      }
    )
    .accessibilityIdentifier(title)
  }
    
  private var navLinkToInterPoemDurationSetting: ModifiedNavLink<some View, some ViewModifier> {
    let title = "歌の間隔"
    return NavigationLink(
      destination: InterPoemDurationSetting(settings: settings),
      label: {
        let item = MenuItem(title: title, value: String(format: "%.2F", settings.interval) + "秒")
        MenuRow(viewModel: .init(item: item))
      }
    )
    .accessibilityIdentifier(title)
    
  }
    
  private var NavLinkToKamiShimoDurationSetting: ModifiedNavLink<some View, some ViewModifier> {
    let title = "上の句と下の句の間隔"
    return NavigationLink(
      destination: KamiShimoDurationSetting(  settings: settings),
      label: {
        let item = MenuItem(
          title: title,
          value: String(format: "%.2F", settings.kamiShimoInterval) + "秒")
        MenuRow(viewModel: .init(item: item))
      })
    .accessibilityIdentifier(title)
  }
  
  private var NavLinkToVolumeSetting: ModifiedNavLink<some View, some ViewModifier> {
    let title = "音量調整"
    return NavigationLink(
      destination: VolumeSetting(settings: settings),
      label: {
        let item = MenuItem(
          title: title,
          value: "\(Int(settings.volume * 100))%")
        MenuRow(viewModel: .init(item: item))
      })
    .accessibilityIdentifier(title)
  }
}

#Preview {
    MenuList(settings: Settings())
}

