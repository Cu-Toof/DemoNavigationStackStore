//
//  SplashStore.swift
//  DemoNavigationStackStore
//
//  Created by Toof on 8/4/23.
//

import ComposableArchitecture

struct Splash: Reducer {
	struct State: Equatable {
		var path = StackState<Path.State>()
	}

	enum Action: Equatable {
		case load
		case path(StackAction<Path.State, Path.Action>)
	}
	
	var body: some ReducerOf<Self> {
		Reduce<State, Action> { state, action in
			switch action {
			case .load:
				state.path.append(.tabBar(TabBar.State()))
				return .none
			case .path:
				return .none
			}
		}
		.forEach(\.path, action: /Action.path) {
			Path()
		}
	}
}

// MARK: - Navigation Path
extension Splash {
	struct Path: Reducer {
		enum State: Equatable {
			case tabBar(TabBar.State)
		}
		
		enum Action: Equatable {
			case tabBar(TabBar.Action)
		}
		
		var body: some Reducer<State, Action> {
			Scope(state: /State.tabBar, action: /Action.tabBar) {
				TabBar()
			}
		}
	}
}
