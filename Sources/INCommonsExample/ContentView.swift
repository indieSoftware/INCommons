//
//  ContentView.swift
//  INCommonsExample
//
//  Created by Sven Korset on 04.03.22.
//

import INCommons
import SwiftUI

struct ContentView: View {
	var body: some View {
		Text("Hello, \(Constant.foo)!")
			.padding()
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
