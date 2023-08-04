//
//  TabBarView.swift
//  DemoNavigationStackStore
//
//  Created by Toof on 8/4/23.
//

import SwiftUI
import ComposableArchitecture

struct TabBarView: View {
	let store: StoreOf<TabBar>

	var body: some View {
		WithViewStore(store, observe: { $0 }) { viewStore in
			TabView(
				selection: viewStore.binding(get: \.selectedTab, send: TabBar.Action.selectedTabChanged)
			) {
				HomeView(store: store.scope(state: \.homeTab, action: TabBar.Action.homeTab))
					.tabItem {
						Text("Home")
					}
					.tag(Tab.home)
				SettingsView(store: store.scope(state: \.settingsTab, action: TabBar.Action.settingsTab))
					.tabItem {
						Text("Settings")
					}
					.tag(Tab.settings)
			}
			.toolbar(.hidden)
		}
	}
}
