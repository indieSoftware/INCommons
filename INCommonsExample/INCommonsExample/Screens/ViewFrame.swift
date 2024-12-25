import INCommons
import SwiftUI

struct ViewFrame: View {
	@State private var arrayAlignment: [AlignmentType] = [
		AlignmentType(alignment: .center, title: "Center"),
		AlignmentType(alignment: .leading, title: "Leading"),
		AlignmentType(alignment: .trailing, title: "Trailing"),
		AlignmentType(alignment: .top, title: "Top"),
		AlignmentType(alignment: .bottom, title: "Bottom"),
		AlignmentType(alignment: .topLeading, title: "TopLeading"),
		AlignmentType(alignment: .topTrailing, title: "TopTrailing"),
		AlignmentType(alignment: .bottomLeading, title: "BottomLeading"),
		AlignmentType(alignment: .bottomTrailing, title: "BottomTrailing")
	]

	var body: some View {
		List(arrayAlignment) { alignmentType in
			Text(alignmentType.title)
				.bold()
				.font(.headline)
				.frame(size: CGSize(width: 250.0, height: 80.0), alignment: alignmentType.alignment)
				.background(Color.black)
				.foregroundColor(.white)
				.cornerRadius(10.0)
		}
		.listStyle(PlainListStyle())
	}
}

private struct AlignmentType: Identifiable {
	let id = UUID()
	let alignment: Alignment
	let title: String
}

struct ViewFrame_Previews: PreviewProvider {
	static var previews: some View {
		ViewFrame()
	}
}
