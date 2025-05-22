//
//  DevKitTabView.swift
//  PovioDevKit
//
//  Created by Yll Fejziu on 20/05/2025.
//

import SwiftUI
import PulseUI
import PulseLogHandler

public struct DevKitTabView: View {
  @Environment(\.presentationMode) private var presentationMode
  let store: LoggerStore

  public init(store: LoggerStore) {
    self.store = store
  }

  public var body: some View {
    NavigationView {
      TabView {
        ToolsListView(store: store)
          .tabItem {
            Image(systemName: "wrench")
            Text("Tools")
          }

        Text("⚙️ Settings coming…")
          .tabItem {
            Image(systemName: "gearshape")
            Text("Settings")
          }
      }
      .navigationTitle("PovioDevKit")
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button {
            presentationMode.wrappedValue.dismiss()
          } label: {
            Image(systemName: "xmark")
          }
        }
      }
    }
  }
}
