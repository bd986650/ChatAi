
import Foundation

struct MessageModel {
    let id: String
    let content: String
    let dateCreated: Date
    let sender: MessageSender
}

enum MessageSender {
    case user
    case chatAI
}
