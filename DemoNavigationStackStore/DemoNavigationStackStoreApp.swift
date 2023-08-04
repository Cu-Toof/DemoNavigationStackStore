//
//  DemoNavigationStackStoreApp.swift
//  DemoNavigationStackStore
//
//  Created by Toof on 8/4/23.
//

import SwiftUI
import ComposableArchitecture

@main
struct DemoNavigationStackStoreApp: App {
    var body: some Scene {
		WindowGroup {
			SplashView(
				store: Store(
					initialState: Splash.State()
				) {
					Splash()._printChanges()
				}
			)
		}
    }
}
