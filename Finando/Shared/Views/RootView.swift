import SwiftUI

struct RootView: View {
    var body: some View {
        HStack(spacing: 0) {
            SideMenuView()
            
            VStack(spacing: 0) {
                HeaderView()
                
//                AccountsView()
                Spacer()
            }
        }
        .ignoresSafeArea()
        .onAppear { NSWindow.allowsAutomaticWindowTabbing = false }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
