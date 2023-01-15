import SwiftUI
/// Represents clear background for fullscreencover on SwiftUI navigation flow
public struct BackgroundBlurView: UIViewRepresentable {
    public func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: .zero)
        view.backgroundColor = .clear
        DispatchQueue.main.async {
            view.superview?.superview?.backgroundColor = .clear
        }
        return view
    }

    public func updateUIView(_ uiView: UIView, context: Context) {}
}
