
import SwiftUI
import Combine

class ViewModel: ObservableObject {
    @Published var countMessages = 0
}

struct HomeView: View {
    
    static let scrollToBottom = "Empty"
    private let pasteboard = UIPasteboard.general
    @ObservedObject var viewModel: ViewModel
    
    @State var cancellables = Set<AnyCancellable>()
    @State var chatMessages: [MessageModel] = [MessageModel]()
    @State var messageText: String = ""
    
    var body: some View {
        ZStack {
            Color.white
            VStack {
                //Spacer().frame(height: 20)
                headerView()
                
                if chatMessages.isEmpty {
                    VStack {
                        EmptyChatView()
                        
                        Spacer()
                    }
                } else {
                    ScrollView {
                        ScrollViewReader { scrollViewProxy in
                            VStack {
                                ForEach(chatMessages, id: \.id) { message in
                                    messageView(message: message)
                                        .onTapGesture {
                                            pasteboard.string = message.content
                                            let vibration = UINotificationFeedbackGenerator()
                                            vibration.notificationOccurred(.success)
                                        }
                                }

                                HStack{
                                    Spacer()
                                }
                                .id(Self.scrollToBottom)
                            }
                            .onReceive(viewModel.$countMessages) { _ in
                                withAnimation(.easeOut(duration: 0.5)) {
                                    scrollViewProxy.scrollTo(Self.scrollToBottom, anchor: .bottom)
                                }
                            }
                        }
                    }
                }
                
                HStack {
                    TextField("Type your message...", text: $messageText)
                        .padding()
                        .foregroundColor(.black)
                        .accentColor(.black)

                    Button {
                        sendMessage()
                        messageText = ""
                    } label: {
                        Image(systemName: messageText == "" ? "circle" : "arrow.up.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                            .scaleEffect(messageText == "" ? 1.0 : 1.3)
                            .foregroundColor(Color("dairyBlue"))
                            .padding()
                    }
                    .disabled(messageText == "")
                }
                .background(.gray.opacity(0.1))
                .cornerRadius(20)
            }
            .padding()
        .onTapGesture { self.hideKeyboard() }
        }
    }
    
    @ViewBuilder
    func headerView() -> some View {
            Button {
                chatMessages.removeAll()
            } label: {
                Image("dairyLogo")
                    .resizable()
                    .frame(width: 100, height: 140, alignment: .center)
            }
    } // headerView

    @ViewBuilder
    func messageView(message: MessageModel) -> some View {
        HStack {
            if message.sender == .user {
                Spacer()
            }
            
            Text(message.content)
                .foregroundColor(message.sender == .user ? .black : .white)
                .padding()
                .background(message.sender == .user ? RoundedCorners(tl: 35, tr: 10, bl: 35, br: 35).fill(.gray.opacity(0.2)) : RoundedCorners(tl: 35, tr: 35, bl: 10, br: 35).fill(Color("dairyBlue")))
            
            if message.sender == .chatAI {
                Spacer()
            }
        }
    }
    
    func sendMessage() {
        let userMessage = MessageModel(id: UUID().uuidString, content: messageText, dateCreated: Date(), sender: .user)
        chatMessages.append(userMessage)
        
        APIServiceManager().sendMessage(message: messageText).sink { completion in
            
        } receiveValue: { response in
            guard let textResponse = response.choices.first?.text.trimmingCharacters(in: .whitespacesAndNewlines.union(.init(charactersIn: "\""))) else { return }
            let chatAIMessage = MessageModel(id: response.id, content: textResponse, dateCreated: Date(), sender: .chatAI)
            self.chatMessages.append(chatAIMessage)
            viewModel.countMessages += 1
        }
        .store(in: &cancellables)
        
        viewModel.countMessages += 1
        print(messageText)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: ViewModel())
    }
}
