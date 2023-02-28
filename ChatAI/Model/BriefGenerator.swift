//
//  BriefGenerator.swift
//  ChatAI
//
//  Created by Aniyah Norman on 2/23/23.
//

import Foundation

// Function that concats input strings and sends a query to ChatGPT
func generateMarketingBrief(product: String, targetDemographic: String, demographicInfo: String, gender: String, targetSentence: String) {
    // Concatenate input strings
    let inputText = "put the following inforation into one sentence: " + product + ". Target demographic age: " + targetDemographic + ". Demographic information: " + demographicInfo + ". Gender: " + gender + ". Sentence on target: " + targetSentence
    
    // API setup
    let urlString = "https://api.openai.com/v1/engines/davinci-codex/completions"
    let url = URL(string: urlString)!
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("Bearer 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", forHTTPHeaderField: "Authorization")
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
    // Request body
    let requestBody: [String: Any] = [
        "prompt": inputText,
        "max_tokens": 150,
        "n": 1,
        "stop": "."
    ]
    request.httpBody = try! JSONSerialization.data(withJSONObject: requestBody, options: [])
    
    // Send API request
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        if let error = error {
            print("Error sending request: \(error.localizedDescription)")
            return
        }
        guard let data = data,
              let response = response as? HTTPURLResponse,
              (200 ..< 300) ~= response.statusCode else {
            print(inputText)
            print("Invalid response from server")
            return
        }
        // printing response in terminal in json
        do {
                    let responseDict = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                    let completions = responseDict?["choices"] as? [[String: Any]]
                    let generatedText = completions?.first?["text"] as? String ?? ""
                    print("AI generated marketing brief: \(generatedText)")
                } catch {
                    print("Error parsing response: \(error.localizedDescription)")
                }
    }
    task.resume()
}




