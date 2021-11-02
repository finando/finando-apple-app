import SwiftUI

struct SideMenuView: View {
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
                    ForEach(SideMenuItem.allCases, id: \.self) { sideMenuItem in
                        Text(sideMenuItem.rawValue)
                            .padding(.vertical, 12)
                            .padding(.horizontal, 16)
                            .frame(maxWidth: .infinity)
                            .background(Color.black)
                    }
                    .padding(.vertical, 6)
                }
                .padding(.vertical, 6)
                
                Spacer()
                
                ZStack {
                    Rectangle()
                        .fill(Color.purple)
                        .frame(height: 64)
                        .frame(maxWidth: .infinity)
                    
                    Text("USER AVATAR")
                }
                .padding(.bottom, 20)
            }
            .frame(width: 230)
            .frame(maxHeight: .infinity)
            .padding(.horizontal, 16)
            .background(Theme.color.neutral.n0.color)
            
            Divider()
                .frame(width: 2)
                .background(Theme.color.neutral.n20.color.opacity(0.5))
                .shadow(color: Color.black.opacity(0.1), radius: 2, x: 2, y: 0)
        }
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}
