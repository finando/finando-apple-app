import Foundation
import SwiftUI

struct Avatar: View {
    let user: User

    @State private var isHoveringOverAvatar = false

    var body: some View {
        HStack(spacing: 0) {
            HStack(spacing: 0) {
                ZStack(alignment: .center) {
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 48, height: 48)
                        .focusable()
                    
                    Text(user.initials)
                        .font(.system(size: 20))
                        .foregroundColor(Color.white)
                }
                .padding(.trailing, 16)

                VStack(alignment: .leading, spacing: 0) {
                    Text(user.firstName)
                        .foregroundColor(.black)
                        .font(.system(size: 18))
                        .bold()
                        .lineLimit(1)
                    
                    Text("Finance enthusiast")
                        .foregroundColor(.blue)
                        .font(.system(size: 12))
                        .lineLimit(1)
                }

                Spacer()
            }
            .padding(8)
            .frame(maxWidth: .infinity)
            .background(Theme.color.neutral.n0.color)
            .cornerRadius(8)
            .shadow(color: isHoveringOverAvatar ? Color.black.opacity(0.15) : Color.clear, radius: 3, x: 0, y: 0)
            .onHover(perform: { isHoveringOverAvatar = $0 }, cursor: NSCursor.pointingHand)
            
            Spacer()
        }
    }
}

struct Avatar_Previews: PreviewProvider {
    static var previews: some View {
        Avatar(user: User(firstName: "Bobby", lastName: "Ray"))
    }
}
