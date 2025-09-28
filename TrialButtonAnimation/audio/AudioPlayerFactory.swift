//
//  AudioPlayerFactory.swift
//  Shuffle100
//
//  Created by 里 佳史 on 2019/07/27.
//  Copyright © 2019 里 佳史. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class AudioPlayerFactory {
    static let shared = AudioPlayerFactory()
    
    func setupAudioSession() {
        // テスト実行時はオーディオセッションのセットアップをスキップ
        guard !isRunningInTestEnvironment() else {
            return
        }

        UIApplication.shared.beginReceivingRemoteControlEvents()

        let session = AVAudioSession.sharedInstance()
        do {
          // CategoryをPlaybackにする
          try session.setCategory(.playback, mode: .default)
          // session有効化
          try session.setActive(true, options: [.notifyOthersOnDeactivation])
        } catch {
          //  Do nothing here:
          // 何らかの理由でうまく行かない場合もアプリを落とさない
          //
          // スクリーンタイムで制限されているときなどは、失敗する。
          // しかし、何度かsetupのチャンスを用意することで、どこかで成功するはず。
          // それでも失敗するようなら、どうしようもない。
          //
//          assertionFailure("AudioSessionの初期設定時エラー: \(error)")

        }
        // 初回再生時のロードによる遅延を回避するために、一度カラ準備しておく。
        _ = AudioPlayerFactory.shared.preparePlayer(folder: "audio/misc", file: "250-milliseconds-of-silence", ofType: "mp3", title: "無音(250ms)")
    }

    private func isRunningInTestEnvironment() -> Bool {
        return ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] != nil
    }
    
    func prepareOpeningPlayer(folder: String) -> AVAudioPlayer {
        let player = preparePlayer(folder: folder, file: "序歌", title: "序歌")
        return player
    }
    
    func preparePlayer(folder: String, file: String, ofType ext: String = "m4a", title: String?) -> AVAudioPlayer {
        // テスト実行時はモックプレイヤーを返す
        if isRunningInTestEnvironment() {
            return createMockAudioPlayer()
        }

        let player: AVAudioPlayer

        guard let path = Bundle.main.path(forResource: folder + "/" + file, ofType: ext) else {
            fatalError("音源ファイルが見つかりません")
        }
        do {
            player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))

        } catch {
            fatalError("\(title ?? "音源")のAudioPlayer生成に失敗しました。folder => [\(folder)]\n - Error: \(error.localizedDescription)")
        }
        player.prepareToPlay()
        return player
    }

    private func createMockAudioPlayer() -> AVAudioPlayer {
        // テスト用の空の音声データ（44.1kHz, 16bit, モノラル, 1秒間の無音）
        let sampleRate = 44100
        let duration = 1.0
        let frameCount = Int(Double(sampleRate) * duration)
        let bytesPerFrame = 2 // 16bit
        let dataSize = frameCount * bytesPerFrame

        var audioData = Data(count: dataSize)
        audioData.withUnsafeMutableBytes { bytes in
            memset(bytes.baseAddress, 0, dataSize)
        }

        // WAVヘッダーを作成
        var wavHeader = Data()

        // RIFF チャンク
        wavHeader.append("RIFF".data(using: .ascii)!)
        wavHeader.append(withUnsafeBytes(of: UInt32(36 + dataSize).littleEndian) { Data($0) })
        wavHeader.append("WAVE".data(using: .ascii)!)

        // fmt チャンク
        wavHeader.append("fmt ".data(using: .ascii)!)
        wavHeader.append(withUnsafeBytes(of: UInt32(16).littleEndian) { Data($0) }) // fmt chunk size
        wavHeader.append(withUnsafeBytes(of: UInt16(1).littleEndian) { Data($0) })  // PCM format
        wavHeader.append(withUnsafeBytes(of: UInt16(1).littleEndian) { Data($0) })  // channels
        wavHeader.append(withUnsafeBytes(of: UInt32(sampleRate).littleEndian) { Data($0) }) // sample rate
        wavHeader.append(withUnsafeBytes(of: UInt32(sampleRate * bytesPerFrame).littleEndian) { Data($0) }) // byte rate
        wavHeader.append(withUnsafeBytes(of: UInt16(bytesPerFrame).littleEndian) { Data($0) }) // block align
        wavHeader.append(withUnsafeBytes(of: UInt16(16).littleEndian) { Data($0) }) // bits per sample

        // data チャンク
        wavHeader.append("data".data(using: .ascii)!)
        wavHeader.append(withUnsafeBytes(of: UInt32(dataSize).littleEndian) { Data($0) })

        // ヘッダーと音声データを結合
        var fullData = wavHeader
        fullData.append(audioData)

        do {
            return try AVAudioPlayer(data: fullData)
        } catch {
            // フォールバック: 最小限のファイルベースモック
            fatalError("モックオーディオプレイヤーの作成に失敗しました: \(error)")
        }
    }
    
//    func preparePlayer(number: Int, side: Side, folder: String) -> AVAudioPlayer {
//        let file = String(format: "%03d", number) + tailForSide(side)
//        let title = "歌番号[\(number)]"
//        let player = preparePlayer(folder: folder, file: file, title: title)
//        return player
//    }
//
//    private func tailForSide(_ side: Side) -> String {
//        switch side {
//        case .kami:
//            return "a"
//        case .shimo:
//            return "b"
//        }
//    }
}

