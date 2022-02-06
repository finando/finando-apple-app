import Foundation
import SwiftUI
import ComponentLibrary

struct AvatarView: View {
    let user: User

    @State private var isHoveringOverAvatar = false

    var body: some View {
        HStack(spacing: 0) {
            ZStack(alignment: .center) {
                Circle()
                    .fill(Color.theme.blue.b50)
                    .frame(width: 40, height: 40)

                Text(user.initials)
                    .font(.title2)
                    .foregroundColor(Color.theme.neutral.n0)
            }
            .padding(.trailing, 12)

            VStack(alignment: .leading, spacing: 0) {
                Text(user.firstName)
                    .foregroundColor(Color.theme.neutral.n60)
                    .font(.title2)
                    .bold()
                    .lineLimit(1)

                Text("Finance enthusiast")
                    .foregroundColor(Color.theme.blue.b50)
                    .font(.callout)
                    .lineLimit(1)
            }

            Spacer()
        }
        .padding(8)
        .frame(maxWidth: .infinity)
        .background(Color.theme.neutral.n0)
        .cornerRadius(8)
        .shadow(color: isHoveringOverAvatar ? Color.theme.neutral.n20 : Color.clear, radius: 3, x: 0, y: 0)
        .onHover(perform: { isHoveringOverAvatar = $0 }, cursor: NSCursor.pointingHand)
    }
}

struct AvatarView_Previews: PreviewProvider {
    static var previews: some View {
        AvatarView(user: User(firstName: "Bobby", lastName: "Ray"))
    }
}
