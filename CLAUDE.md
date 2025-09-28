# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## プロジェクト概要

TrialButtonAnimationは、日本の古典詩歌（百人一首）の学習・練習用iOS SwiftUIアプリケーションです。複数の方法で歌を選択し、カスタマイズ可能なタイミングと音声設定で学習できます。

## ビルドとテストコマンド

### ビルド
```bash
# プロジェクトをビルド
xcodebuild -project TrialButtonAnimation.xcodeproj -scheme TrialButtonAnimation build

# テスト用にビルド
xcodebuild -project TrialButtonAnimation.xcodeproj -scheme TrialButtonAnimation build-for-testing
```

### テスト
```bash
# テストプランを使用してすべてのテストを実行
xcodebuild test -project TrialButtonAnimation.xcodeproj -testPlan TrialButtonAnimation

# ユニットテストのみ実行
xcodebuild test -project TrialButtonAnimation.xcodeproj -scheme TrialButtonAnimation -destination 'platform=iOS Simulator,name=iPhone 17' -only-testing:TrialButtonAnimationTests

# UIテストのみ実行
xcodebuild test -project TrialButtonAnimation.xcodeproj -scheme TrialButtonAnimation -destination 'platform=iOS Simulator,name=iPhone 17' -only-testing:TrialButtonAnimationUITests

# 特定のUIテストクラスを実行
xcodebuild test -project TrialButtonAnimation.xcodeproj -scheme TrialButtonAnimation -destination 'platform=iOS Simulator,name=iPhone 17' -only-testing:TrialButtonAnimationUITests/VolumeSettingUITests
```

### Ruby依存関係
```bash
# xcpretty（オプション）用のRuby依存関係をインストール
bundle install
```

## コーディング規約

- **インデント**: 半角スペースを使用
- **インデント幅**: 2スペース
- **既存のコードスタイルに従う**: ファイルを編集する際は、そのファイルの既存のコーディング規約を維持する

## アーキテクチャ

### 基本構造
- **アプリエントリーポイント**: `TrialButtonAnimationApp.swift` → `ContentView.swift` → `MenuList.swift`
- **ナビゲーション**: SwiftUI NavigationStackとメインメニュー構造を使用
- **状態管理**: アプリ全体に渡される中央の`Settings`クラス
- **UIパターン**: 専用の`viewModels/`ディレクトリにViewModelを配置したMVVM

### 主要ディレクトリ
- `views/` - SwiftUI ビューコンポーネント
- `viewModels/` - ビューモデルクラス、特定機能用ViewModelの`toretaViewModels/`サブディレクトリを含む
- `models/` - データモデルとビジネスロジック
- `models/enums/` - プロトコルベースアーキテクチャを持つ列挙型定義
- `supports/` - サポートユーティリティと型

### プロトコルベース設計
アプリは洗練されたプロトコルベースアーキテクチャを使用、特にDigitsシステムで：
- `Digits`プロトコル: 数字ベースの歌選択の共通動作を定義
- `Digits01`と`Digits10`: 1桁と10桁選択の具体実装
- `DigitsPicker<D: Digits>`: 任意のDigits型で動作する汎用ピッカービュー
- `PoemNumbersProvidable`: 歌番号を提供できる型のプロトコル

### UIテストアーキテクチャ
UIテストはPage Object Modelパターンに従う：
- `pages/`ディレクトリにページオブジェクトクラスを配置
- `protocols/`ディレクトリに`PageObjectable`と`WaitInUITest`などの共有プロトコルを配置
- 各主要画面に対応するUIテストクラスを用意

### 機能
アプリは複数の歌選択方法を提供：
- N-gram ベース選択（最初の文字）
- 五色分類（五色百人一首）
- 一桁選択（1-9）
- 二桁選択（10-99）
- タイミング間隔、音量、暗記タイマーの設定

### 命名規則
- UI全体で日本語テキストを使用
- ファイル名は英語だが日本語文字列を含む場合がある
- UIテスト用のAccessibilityIdentifierは日本語タイトルを使用