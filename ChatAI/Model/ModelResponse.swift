
import Foundation

struct ModelResponse: Decodable {
    let id: String
    let choices: [ModelChoice]
}
