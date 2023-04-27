
import SwiftUI

struct EmptyChatView: View {

    @State private var blinkLeftEye = true
    @State private var blinkRightEye = true
    @State private var trimMouth = false
    @State private var shake = false
    @State private var writing = false
    @State private var movingCursor = false
    @State private var blinkingCursor = false
    
    let cursorColor = Color(.white)
    let emptyChatColor = Color(.white)
    
    var body: some View {
        VStack {
            ZStack {
                ChatIconView()
                    .rotationEffect(.degrees(shake ? -5 : 5), anchor: .bottomTrailing)
                
                VStack {
                    HStack(spacing: 16) {
                        RoundedRectangle(cornerRadius: 2)
                            .frame(width: 8, height: 4)
                            .scaleEffect(y: blinkRightEye ? 0.1 : 1)
                            .opacity(blinkRightEye ? 0.1 : 1)
                        RoundedRectangle(cornerRadius: 2)
                            .frame(width: 8, height: 4)
                            .scaleEffect(y: blinkLeftEye ? 0.05 : 1)
                    }
                    Circle()
                        .trim(from: trimMouth ? 0.5 : 0.6, to: trimMouth ? 0.9 : 0.8)
                        .stroke(style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
                        .frame(width: 16, height: 16)
                        .rotationEffect(.degrees(200))
                }.foregroundColor(emptyChatColor)
                    .rotationEffect(.degrees(shake ? -5 : 5), anchor: .bottomLeading)
            }
            .onAppear {
                withAnimation(.easeInOut(duration: 1).repeatForever()){
                    blinkRightEye.toggle()
                }
                
                withAnimation(.easeOut(duration: 1).repeatForever()){
                    blinkLeftEye.toggle()
                }
                withAnimation(.easeOut(duration: 1).repeatForever()){
                    trimMouth.toggle()
                }
                
                withAnimation(.easeOut(duration: 1).repeatForever()){
                    shake.toggle()
                }

                withAnimation(.easeOut(duration: 2).delay(1).repeatForever(autoreverses: true)) {
                    writing.toggle()
                    movingCursor.toggle()
                }

                withAnimation(.easeInOut(duration: 0.6).repeatForever(autoreverses: true)) {
                    blinkingCursor.toggle()
                }
            }
            
            ZStack(alignment: .leading) {
                VStack {
                    Text("Ask Me About Marketing!")
                        .font(.body)
                    .mask(Rectangle().offset(x: writing ? 0 : -150))
                    Image("cowIcon")
                        .resizable()
                        .frame(width: 80, height: 60)
                        .font(.body)
                        .mask(Rectangle().offset(x: writing ? 0 : -150))
                }
                
                Rectangle()
                    .fill(cursorColor)
                    .opacity(blinkingCursor ? 0 : 1)
                    .frame(width: 2, height: 24)
                    .offset(x: movingCursor ? 148 : 0)
            }
        }
    }
}

struct EmptyChatView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyChatView()
    }
}
