//
//  SplashView.swift
//  DemoNavigationStackStore
//
//  Created by Toof on 8/4/23.
//

import SwiftUI
import ComposableArchitecture

struct SplashView: View {
	let store: StoreOf<Splash>

	var body: some View {
		NavigationStackStore(
			store.scope(state: \.path, action: { .path($0) }),
			root: {
				Text("Splash")
					.onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                            ViewStore(store, observe: { $0 }).send(.load)
                        }
					}
			},
			destination: {
				switch $0 {
				case .tabBar:
					CaseLet(
						/Splash.Path.State.tabBar,
						action: Splash.Path.Action.tabBar,
						then: TabBarView.init(store:)
					)
				}
			}
		)
	}
}
