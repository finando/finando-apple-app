import Foundation
import SwiftUI

struct Avatar: View {
    let user: User

    @State private var isHoveringOverAvatar = false

    var body: some View {
        HStack(spacing: 0) {
            ZStack(alignment: .center) {
                Circle()
                    .fill(Theme.color.blue.b50.color)
                    .frame(width: 40, height: 40)

                Text(user.initials)
                    .font(.title2)
                    .foregroundColor(Theme.color.neutral.n0.color)
            }
            .padding(.trailing, 12)

            VStack(alignment: .leading, spacing: 0) {
                Text(user.firstName)
                    .foregroundColor(Theme.color.neutral.n60.color)
                    .font(.title2)
                    .bold()
                    .lineLimit(1)

                Text("Finance enthusiast")
                    .foregroundColor(Theme.color.blue.b50.color)
                    .font(.callout)
                    .lineLimit(1)
            }

            Spacer()
        }
        .padding(8)
        .frame(maxWidth: .infinity)
        .background(Theme.color.neutral.n0.color)
        .cornerRadius(8)
        .shadow(color: isHoveringOverAvatar ? Theme.color.neutral.n20.color : Color.clear, radius: 3, x: 0, y: 0)
        .onHover(perform: { isHoveringOverAvatar = $0 }, cursor: NSCursor.pointingHand)
    }
}

struct Avatar_Previews: PreviewProvider {
    static var previews: some View {
        Avatar(user: User(firstName: "Bobby", lastName: "Ray"))
    }
}
