import SwiftUI
import SwiftUIRouter
import ComponentLibrary

struct SideMenuView: View {
    @EnvironmentObject var navigator: Navigator

    var body: some View {
        HStack(spacing: 0) {
            VStack(spacing: 0) {
                ZStack {
                    Rectangle()
                        .fill(Color.green)
                        .frame(height: 64)
                        .frame(maxWidth: .infinity)

                    Text("LOGO")
                }
                .padding(.top, 64)

                VStack(spacing: 0) {
                    ForEach(ApplicationRoute.allCases, id: \.self) { route in
                        Button(route.translation, action: { navigator.navigate(route.path, replace: true) })
                            .padding(.vertical, 12)
                            .padding(.horizontal, 16)
                            .frame(maxWidth: .infinity)
                            .background(Color.black)
                            .buttonStyle(PlainButtonStyle())
                    }
                    .padding(.vertical, 6)
                }
                .padding(.vertical, 6)

                Spacer()

                AvatarView(user: User(firstName: "Bobby", lastName: "Ray"))
                    .padding(.bottom, 20)
            }
            .frame(width: 230)
            .frame(maxHeight: .infinity)
            .padding(.horizontal, 16)
            .background(Color.theme.neutral.n0)

            Divider()
                .frame(width: 2)
                .background(Color.theme.neutral.n20.opacity(0.5))
                .shadow(color: Color.black.opacity(0.1), radius: 2, x: 2, y: 0)
        }
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}
