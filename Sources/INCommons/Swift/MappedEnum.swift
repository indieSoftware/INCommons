/**
 Maps each enum case to a mapped value.

 The enum needs to have a raw representable value of the type `Int` and a static array of the values to map accessible by the case's raw value.

 The following example code will return `UIColor.black` for `MyBool.myFalse.mappedValue`.

 ```
 enum MyBool: Int, MappedEnum {
 case myTrue
 case myFalse
 static var mapping: [UIColor] = [.white, .black]
 }
 ```
 */
public protocol MappedEnum: RawRepresentable where Self.RawValue == Int {
	associatedtype MapValueType
	/// The index of each value has to match the enum case's raw value.
	static var mapping: [MapValueType] { get }
	/// Returns the value representing the case value.
	var mappedValue: MapValueType { get }
}

public extension MappedEnum {
	var mappedValue: MapValueType {
		Self.mapping[rawValue]
	}
}
