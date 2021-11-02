import SwiftUI

struct HeaderView: View {
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 200, height: 40)

                Spacer()

                Rectangle()
                    .fill(Color.red)
                    .frame(width: 40, height: 40)
            }
            .padding(EdgeInsets(top: 12, leading: 16, bottom: 12, trailing: 16))
            .frame(maxWidth: .infinity, maxHeight: 64)
            .background(Theme.color.neutral.n0.color)

            Divider()
                .frame(maxWidth: .infinity, maxHeight: 2)
                .background(Theme.color.neutral.n20.color.opacity(0.5))
                .shadow(color: Color.black.opacity(0.1), radius: 2, x: 0, y: 2)
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
