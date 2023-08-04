//
//  TabBarStore.swift
//  DemoNavigationStackStore
//
//  Created by Toof on 8/4/23.
//

import ComposableArchitecture

enum Tab {
	case home, settings
}

struct TabBar: Reducer {
	struct State: Equatable {
		var homeTab = Home.State()
		var settingsTab = Settings.State()
		var selectedTab: Tab = .home
	}
	
	enum Action: Equatable {
		case homeTab(Home.Action)
		case settingsTab(Settings.Action)
		case selectedTabChanged(Tab)
	}
	
	var body: some ReducerOf<Self> {
		Reduce<State, Action> { state, action in
			switch action {
			case let .selectedTabChanged(tab):
				state.selectedTab = tab
				return .none
			default:
				return .none
			}
		}
		Scope(state: \.homeTab, action: /Action.homeTab) {
			Home()
		}
		Scope(state: \.settingsTab, action: /Action.settingsTab) {
			Settings()
		}
	}
}
