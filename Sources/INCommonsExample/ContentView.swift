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
