//
//  HomeView.swift
//  DemoNavigationStackStore
//
//  Created by Toof on 8/4/23.
//

import SwiftUI
import ComposableArchitecture

struct HomeView: View {
	let store: StoreOf<Home>

	var body: some View {
		NavigationStackStore(
			store.scope(state: \.path, action: { .path($0) }),
			root: {
				Text("Home")
			},
			destination: {
				switch $0 {
				case .detail:
					CaseLet(
						/Home.Path.State.detail,
						action: Home.Path.Action.detail,
						then: HomeDetailView.init(store:)
					)
				}
			}
		)
	}
}
