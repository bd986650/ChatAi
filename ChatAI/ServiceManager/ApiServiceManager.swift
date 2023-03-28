
import Foundation
import Alamofire
import Combine

class APIServiceManager {
    let baseUrl = "https://api.openai.com/v1/"
    
    func sendMessage(message: String) -> AnyPublisher<ModelResponse, Error>{
        let model = Model(model: "text-davinci-003", prompt: message, temperature: 0.9, max_tokens: 2048)
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(Constants.API_KEY)"
        ]
        
        return Future { [weak self] promise in
            guard let self = self else { return }
            AF.request(self.baseUrl + "completions", method: .post, parameters: model, encoder: .json, headers: headers).responseDecodable(of: ModelResponse.self) { response in
                switch response.result {
                case.success(let result):
                    promise(.success(result))
//                    print(result)
                case.failure(let error):
                    promise(.failure(error))
                    print(error)
                }
            }
        }
        .eraseToAnyPublisher()
    }
}
