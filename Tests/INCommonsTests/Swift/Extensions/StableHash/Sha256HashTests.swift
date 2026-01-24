import Foundation
@testable import INCommons
import Testing

@MainActor
struct Sha256HashTests {
	@Test func stringHashIsStable() throws {
		let input1 = "Hello, world!"
		#expect(input1.sha256HashString == "315f5bdb76d078c43b8ac0064e4a0164612b1fce77c869345bfc94c75894edd3")
		#expect(input1.sha256HashInt == 3_557_663_228_795_320_516)
		let input1Data = Data(input1.utf8)
		#expect(input1Data.sha256HashString == "315f5bdb76d078c43b8ac0064e4a0164612b1fce77c869345bfc94c75894edd3")
		#expect(input1Data.sha256HashInt == 3_557_663_228_795_320_516)

		let input2 = "Hello, World!"
		#expect(input2.sha256HashString == "dffd6021bb2bd5b0af676290809ec3a53191dd81c7f70a4b28688a362182986f")
		#expect(input2.sha256HashInt == -2_306_581_736_153_426_512)
		let input2Data = Data(input2.utf8)
		#expect(input2Data.sha256HashString == "dffd6021bb2bd5b0af676290809ec3a53191dd81c7f70a4b28688a362182986f")
		#expect(input2Data.sha256HashInt == -2_306_581_736_153_426_512)
	}
}
