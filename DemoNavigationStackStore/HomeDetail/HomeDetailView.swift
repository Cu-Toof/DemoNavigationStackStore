//
//  HomeDetailView.swift
//  DemoNavigationStackStore
//
//  Created by Toof on 8/4/23.
//

import SwiftUI
import ComposableArchitecture

struct HomeDetailView: View {
	let store: StoreOf<HomeDetail>

	var body: some View {
		WithViewStore(store, observe: { $0 }) { viewStore in
			Text("Home Detai View")
		}
	}
}
