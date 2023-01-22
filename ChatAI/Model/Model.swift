
import Foundation

struct Model: Encodable {
    let model: String
    let prompt: String
    let temperature: Float?
    let max_tokens: Int
}
