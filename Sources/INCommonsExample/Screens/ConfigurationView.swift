import INCommons
import SwiftUI

struct ConfigurationView: View {
	@State private var config = Configuration()

	var body: some View {
		VStack {
			HStack(spacing: 10.0) {
				Text(config.id)
					.bold()
					.font(.largeTitle)
					.foregroundColor(.red)

				VStack(alignment: .leading, spacing: 8.0) {
					Text(config.name)
						.font(.headline)
					Text(config.email)
						.font(.subheadline)
					Text("\(config.age)")
						.fontWeight(.medium)
				}
			}
			Spacer()
		}.onAppear {
			self.parseTheFile()
		}
	}

	func parseTheFile() {
		if case let .success(data) = ConfigLoader.parseConfig() as Result<Configuration, ConfigLoader.Error> {
			config = data
		}
	}
}

private struct Configuration: Decodable {
	var id: String = ""
	var name: String = ""
	var email: String = ""
	var age: Int = 0
}
