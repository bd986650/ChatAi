//
//  CaptionGenerator.swift
//  ChatAI
//
//  Created by Aniyah Norman on 2/23/23.
//

import Foundation

func generateInstagramCaption(title: String, location: String, hashtags: [String], prompt: String){
    // concatenate the input strings
    let promptText = "\(title) at \(location): \(prompt)"
    let hashtagText = " #" + hashtags.joined(separator: " #")
    let inputText = promptText + hashtagText
    
    // create the API request
    let apiKey = ""
    let apiUrl = URL(string: "https://api.openai.com/v1/engines/davinci-codex/completions")!
    var request = URLRequest(url: apiUrl)
    request.httpMethod = "POST"
    request.addValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    
    // encode the input text as JSON
    let inputDict: [String: Any] = [
        "prompt": inputText,
        "max_tokens": 60,
        "temperature": 0.5,
        "n": 1,
        "stop": ["\n"]
    ]
    let inputData = try! JSONSerialization.data(withJSONObject: inputDict, options: [])
    request.httpBody = inputData
    
    // send the API request and parse the response
    let semaphore = DispatchSemaphore(value: 0)
    //var outputText: String? = nil
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        defer { semaphore.signal() }
        guard let data = data, let response = response as? HTTPURLResponse, error == nil else {
            print("Error sending API request: \(error?.localizedDescription ?? "unknown error")")
            return
        }
        if response.statusCode != 200 {
            print("API request returned status code \(response.statusCode)")
            return
        }
        let responseDict = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
        let choices = responseDict["choices"] as! [[String: Any]]
        let caption = choices[0]["text"] as! String
        print("AI Generated Instagram Caption: " + caption)
    }
    task.resume()
//    semaphore.wait()
//
//    return outputText
}

