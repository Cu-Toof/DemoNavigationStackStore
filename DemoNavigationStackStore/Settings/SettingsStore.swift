//
//  SettingsStore.swift
//  DemoNavigationStackStore
//
//  Created by Toof on 8/4/23.
//

import ComposableArchitecture

struct Settings: Reducer {
	struct State: Equatable {

	}

	enum Action: Equatable {
		
	}

	var body: some ReducerOf<Self> {
		Reduce<State, Action> { state, action in
			switch action {
			default: return .none
			}
		}
	}
}
