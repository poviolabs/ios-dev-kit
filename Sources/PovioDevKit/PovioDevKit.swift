import Foundation
import SwiftUI
import UIKit
import Pulse
import PulseUI
import PulseLogHandler
import Logging

public final class PovioDevKit {
  public static let shared = PovioDevKit()
  private let store: LoggerStore

  private init() {
    let caches  = FileManager.default
      .urls(for: .cachesDirectory, in: .userDomainMask)[0]
    let storeURL = caches.appendingPathComponent("PovioDevKitLogs",
                                                 isDirectory: true)
    try? FileManager.default.createDirectory(at: storeURL,
                                             withIntermediateDirectories: true)
    self.store = try! LoggerStore(storeURL: storeURL)
  }

  public func start() {
    LoggingSystem.bootstrap { label in
      var handler = PersistentLogHandler(label: label, store: self.store)
      handler.logLevel = .trace
      return handler
    }

    URLSessionProxyDelegate.enableAutomaticRegistration(logger: networkLogger)

    ShakeTrigger().subscribe { [weak self] in
      self?.presentConsole()
    }
  }
  public func consoleView() -> some View {
    ConsoleView(store: store)
  }

  private func presentConsole() {
    guard let rootViewController else { return }

    if let host = rootViewController.presentedViewController as? UIHostingController<DevKitTabView> {
      rootViewController.dismiss(animated: true)
    } else {
      let rootView = DevKitTabView(store: store)
      let host = UIHostingController(rootView: rootView)
      host.modalPresentationStyle = .fullScreen
      rootViewController.present(host, animated: true)
    }
  }

  private var rootViewController: UIViewController? {
    UIApplication.shared.connectedScenes
      .compactMap { $0 as? UIWindowScene }
      .flatMap { $0.windows }
      .first { $0.isKeyWindow }?
      .rootViewController
  }

  private var networkLogger: NetworkLogger {
    NetworkLogger(store: store)
  }
}
