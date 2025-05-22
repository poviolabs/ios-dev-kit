//
//  ToolsListView.swift
//  PovioDevKit
//
//  Created by Yll Fejziu on 20/05/2025.
//

import SwiftUI
import PulseUI
import PulseLogHandler

public struct ToolsListView: View {
  let store: LoggerStore
  
  public init(store: LoggerStore) {
    self.store = store
  }
  
  public var body: some View {
    List {
      networkLoggerRow
    }
    .listStyle(InsetGroupedListStyle())
  }
}

// MARK: - Private
private extension ToolsListView {
  var networkLoggerRow: some View {
    NavigationLink(destination: ConsoleView(store: store).closeButtonHidden()) {
      HStack {
        Image(systemName: "network")
          .foregroundColor(.accentColor)
        Text("Pulse Network Logger")
      }
    }
  }
}
