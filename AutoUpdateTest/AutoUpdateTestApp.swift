//
//  AutoUpdateTestApp.swift
//  AutoUpdateTest
//
//  Created by guru on 1/13/23.
//

import AppUpdater
import SwiftUI

@main
struct PhoenixApp: App {
  @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
  var body: some Scene {
    WindowGroup {
      VStack {
        Button(action: {
          self.appDelegate.userRequestedAnExplicitUpdateCheck()
        }) {
          Text("Check for Updates")
        }
        .buttonStyle(PlainButtonStyle())
        .border(Color.black, width: 2)
      }
      ContentView()
    }
  }
}
class AppDelegate: NSObject, NSApplicationDelegate {
  let updater = AppUpdater(owner: "gurubac", repo: "releasetest")
  func userRequestedAnExplicitUpdateCheck() {
    updater.check().catch(policy: .allErrors) { error in
      if error.isCancelled {
        // promise is cancelled if we are already up-to-date
        print("up to date!")
      } else {
        // show alert for this error
        print("some error")
        print(error)
        let errorMessage = "Error: \(error.localizedDescription)"
        let alert = NSAlert()
        alert.messageText = "Update Error"
        alert.informativeText = errorMessage
        alert.addButton(withTitle: "OK")
        alert.runModal()
      }
    }
  }
}
