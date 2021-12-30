import SwiftUI

private struct HoverViewModifier: ViewModifier {
    private let action: (Bool) -> Void
    private let cursor: NSCursor?

    init(action: @escaping (Bool) -> Void, cursor: NSCursor?) {
        self.action = action
        self.cursor = cursor
    }

    func body(content: Content) -> some View {
        content.background(GeometryReader { Representable(action: action, cursor: cursor, frame: $0.frame(in: .global)) })
    }

    private struct Representable: NSViewRepresentable {
        let action: (Bool) -> Void
        let cursor: NSCursor?
        let frame: NSRect

        fileprivate func makeCoordinator() -> Coordinator {
            return Coordinator(action: action, cursor: cursor)
        }

        fileprivate class Coordinator: NSResponder {
            private final let action: (Bool) -> Void
            private final let cursor: NSCursor?

            init(action: @escaping (Bool) -> Void, cursor: NSCursor?) {
                self.action = action
                self.cursor = cursor
                super.init()
            }

            required init?(coder: NSCoder) {
                fatalError("init(coder:) has not been implemented")
            }

            override func mouseEntered(with event: NSEvent) {
                action(true)
                changeCursor(cursor, true)
            }

            override func mouseExited(with event: NSEvent) {
                action(false)
                changeCursor(cursor, false)
            }

            private func changeCursor(_ cursor: NSCursor?, _ isHovering: Bool) {
                if let cursor = cursor {
                    DispatchQueue.main.async {
                        if isHovering {
                            cursor.push()
                        } else {
                            NSCursor.pop()
                        }
                    }
                }
            }
        }

        func makeNSView(context: Context) -> NSView {
            let view = NSView(frame: frame)

            let options: NSTrackingArea.Options = [
                .mouseEnteredAndExited,
                .inVisibleRect,
                .activeAlways
            ]

            let trackingArea = NSTrackingArea(rect: frame, options: options, owner: context.coordinator, userInfo: nil)

            view.addTrackingArea(trackingArea)

            return view
        }

        func updateNSView(_ nsView: NSView, context: Context) {}

        static func dismantleNSView(_ nsView: NSView, coordinator: Coordinator) {
            nsView.trackingAreas.forEach { nsView.removeTrackingArea($0) }
        }
    }
}

extension View {
    public func onHover(perform action: @escaping (Bool) -> Void, cursor: NSCursor? = nil) -> some View {
        modifier(HoverViewModifier(action: action, cursor: cursor))
    }
}
