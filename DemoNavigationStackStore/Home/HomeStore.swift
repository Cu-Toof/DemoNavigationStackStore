//
//  HomeStore.swift
//  DemoNavigationStackStore
//
//  Created by Toof on 8/4/23.
//

import ComposableArchitecture

struct Home: Reducer {
	struct State: Equatable {
		var path = StackState<Path.State>()
	}
	
	enum Action: Equatable {
		case path(StackAction<Path.State, Path.Action>)
	}
	
	var body: some ReducerOf<Self> {
		Reduce<State, Action> { state, action in
			switch action {
			default:
				return .none
			}
		}
		.forEach(\.path, action: /Action.path) {
			Path()
		}
	}
}

// MARK: - Navigation Path
extension Home {
	struct Path: Reducer {
		enum State: Equatable {
			case detail(HomeDetail.State)
		}
		
		enum Action: Equatable {
			case detail(HomeDetail.Action)
		}
		
		var body: some Reducer<State, Action> {
			Scope(state: /State.detail, action: /Action.detail) {
				HomeDetail()
			}
		}
	}
}
