import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack(alignment: .center) {
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
        .background(Color.white)
    }
    
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
