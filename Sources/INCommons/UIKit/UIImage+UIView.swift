import UIKit

public extension UIImage {
	/**
	 Initializes an image with a view's content.

	 - parameter view: The view to create an image from.
	 */
	@MainActor
	convenience init?(view: UIView) {
		UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.isOpaque, 0.0)
		_ = view.drawHierarchy(in: view.bounds, afterScreenUpdates: false)
		let image = UIGraphicsGetImageFromCurrentImageContext()
		UIGraphicsEndImageContext()

		guard let cgImage = image?.cgImage else {
			return nil
		}
		self.init(cgImage: cgImage)
	}
}
