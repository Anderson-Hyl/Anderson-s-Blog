import Foundation
import SwiftUI

public struct TextStyling: View {
	public var body: some View {
		(
			Text("Play smarter with ").font(.title2).foregroundStyle(.primary) +
			Text("Subscription").font(.title).foregroundStyle(.blue.gradient)
		)
		.padding()
	}
}

#Preview {
	TextStyling()
}
