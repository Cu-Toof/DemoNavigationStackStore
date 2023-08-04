//
//  SettingsView.swift
//  DemoNavigationStackStore
//
//  Created by Toof on 8/4/23.
//

import SwiftUI
import ComposableArchitecture

struct SettingsView: View {
	let store: StoreOf<Settings>
	
	var body: some View {
		WithViewStore(store, observe: { $0 }) { viewStore in
			Text("Settings")
		}
	}
}
