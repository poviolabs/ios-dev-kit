# PovioDevKit

**An in-app debug toolkit for iOS**  
Shake to reveal a customizable Tab-view of tools—starting with a full [Pulse](https://github.com/kean/Pulse)-powered Network Logger.  

[![SPM Compatible](https://img.shields.io/badge/SwiftPM-Compatible-brightgreen.svg)](#installation)  
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

---

## Features

- **Shake-to-open** debug console (no boilerplate window subclass or SceneDelegate changes).  
- **Pulse** integration for logging and network inspection—all your `URLSession` (and Alamofire/OpenAPI) calls show up.  
- **TabView** architecture—add new tools (feature toggles, performance monitors, etc.) alongside “Network.”  
- **Swift Package Manager** delivery—drop it in and go.

---

## 📦 Installation

1. In Xcode go to **File → Swift Packages → Add Package Dependency…**  
2. Enter `https://github.com/poviolabs/ios-dev-kit.git`  
3. Choose a version (e.g. `Up to Next Major` `1.0.0`).

---

## 🚀 Quick Start

### 1. Bootstrap in AppDelegate

```swift
import UIKit
import PovioDevKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    // Kick off logging, network proxy & shake trigger
    PovioDevKit.shared.start()
    return true
  }
}
