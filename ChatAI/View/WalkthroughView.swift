//
//  WalkthroughView.swift
//  ChatAI
//
//  Created by Aniyah Norman on 3/16/23.
//

import SwiftUI
import Combine
var totalViews = 5
class UserInfo: ObservableObject {
    @EnvironmentObject var dataManager: DataManager
    
    @Published var mission = ""
    @Published var values = ""
    @Published var advantage = ""
    @Published var work = ""
    @Published var goals = ""
    @Published var expectation = ""
    @Published var age = ""
    @Published var gender = ""
    @Published var they = ""
    @Published var point = ""
    @Published var reservation = ""
    @Published var interaction = ""
    @Published var tone = ""
    @Published var message = ""
    @Published var style = ""
}

struct WalkthroughView: View {
    @EnvironmentObject var dataManager: DataManager
    let userInfo = UserInfo()

    @State var currentView = 1
    
    var body: some View {
        VStack {
            // Text("\(currentView)")
            if currentView != 6 {
                WalkthroughScreen(current: $currentView) .navigationBarBackButtonHidden(true)
                    .environmentObject(userInfo)
                    .environmentObject(dataManager)
            } else {
                //make api call here with all the variables and send information to backend to be grabbed by profile view
               
                ProfileandHomePageView().navigationBarBackButtonHidden(true)
            }
        }
    }
    

}
struct WalkthroughScreen: View {
    @EnvironmentObject var dataManager: DataManager
    @State var AIResponse: String = ""
    @State var chatMessages: [MessageModel] = [MessageModel]()
    @State var cancellables = Set<AnyCancellable>()
    @State var messageText: String = ""
    @Binding var current: Int
    @EnvironmentObject var userInfo: UserInfo
    var body: some View {
        ZStack{
            VStack{
                Group {
                    if current == 1 {
                        BrandInfoView()
                            .environmentObject(userInfo)
                    
                    } else if current == 2 {
                        
                        GoalInfoView()
                            .environmentObject(userInfo)
                    } else if current == 3 {
                        CustomerInfoView()
                            .environmentObject(userInfo)
                    } else if current == 4 {
                        CustomerNeedsView()
                            .environmentObject(userInfo)
                    } else {
                        
                        CreativeDirectionView()
                            .environmentObject(userInfo)
                    }
                }.padding()
                
                Button(
                    action:{
                        withAnimation {
                            if current <= totalViews  {
                                current += 1
                             
                              
                            }
                            if current == 6 {
                                sendMessage()
                            }
                        }
                    },
                    label: {
                        Text("NEXT")
                            .padding(.vertical, 10)
                            .padding(.horizontal, 40)
                            .frame(width: 150)
                            .background(
                                RoundedRectangle(cornerRadius: 24)
                                    .stroke(.blue)
                            )
                    }
                )
                Button(
                    action:{
                        withAnimation {
                            if current > 1  {
                                
                                current -= 1
                            } else if current == 1 {
                                current = 1
                            }
                           
                        }
                    },
                    label: {
                        Text("BACK")
                            .padding(.vertical, 10)
                            .padding(.horizontal, 40)
                            .frame(width: 150)
                            .background(
                                RoundedRectangle(cornerRadius: 24)
                                    .stroke(.blue)
                            )
                    }
                )
                .opacity(current == 1 ? 0 : 1)
                
                HStack(spacing: 20) {
                    
                    ForEach((1...5), id: \.self) { i in
                        if current == i {
                            Image("cowIcon")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80)
                        } else {
                            Circle()
                                .frame(width: 10)
                                .foregroundColor(.gray.opacity(0.4))
                        }
                    }
                    
//                    if current == 1 {
//                        Image("cowIcon")
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .frame(width: 80)
//                    } else {
//                        Circle()
//                            .frame(width: 10)
//                            .foregroundColor(.gray.opacity(0.4))
//                    }
//
//                    if current == 2 {
//                        Image("cowIcon")
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .frame(width: 80)
//                    } else {
//                        Circle()
//                            .frame(width: 10)
//                            .foregroundColor(.gray.opacity(0.4))
//                    }
//
//                    if current == 3 {
//                        Image("cowIcon")
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .frame(width: 80)
//                    } else {
//                        Circle()
//                            .frame(width: 10)
//                            .foregroundColor(.gray.opacity(0.4))
//                    }
                }
            }
        }
  
    }
    
    func sendMessage() {
        //get user for company name
        
        let companyName = dataManager.users[0].businessName
        let messageText = "Write a content calendar for a company with this mission: " + userInfo.mission
        
        let instagram = "Write 10 instagram posts separated by a newline character for a company with this name \(companyName), this mission: \(userInfo.mission). The values we hold dear are \(userInfo.values), and we believe our greatest advantage is \(userInfo.advantage). Our work involves \(userInfo.work), and our goals include \(userInfo.goals). We expect \(userInfo.expectation) from our customers, who are typically \(userInfo.age) year old \(userInfo.gender)s. They often struggle with \(userInfo.they), but our product/service can help them with \(userInfo.point). We take pride in our \(userInfo.reservation) approach to business, and strive to create positive \(userInfo.interaction) with our customers. Our tone is typically \(userInfo.tone), and our style can be described as \(userInfo.style). DO NOT NUMBER THEM"
        
        let facebook = "Write 10 facebook posts separated by a newline character for a company with this name \(companyName), this mission: \(userInfo.mission). The values we hold dear are \(userInfo.values), and we believe our greatest advantage is \(userInfo.advantage). Our work involves \(userInfo.work), and our goals include \(userInfo.goals). We expect \(userInfo.expectation) from our customers, who are typically \(userInfo.age) year old \(userInfo.gender)s. They often struggle with \(userInfo.they), but our product/service can help them with \(userInfo.point). We take pride in our \(userInfo.reservation) approach to business, and strive to create positive \(userInfo.interaction) with our customers. Our tone is typically \(userInfo.tone), and our style can be described as \(userInfo.style). DO NOT NUMBER THEM"
        let twitter = "Write 10 twitter posts separated by a newline character for a company with this name \(companyName), this mission: \(userInfo.mission). The values we hold dear are \(userInfo.values), and we believe our greatest advantage is \(userInfo.advantage). Our work involves \(userInfo.work), and our goals include \(userInfo.goals). We expect \(userInfo.expectation) from our customers, who are typically \(userInfo.age) year old \(userInfo.gender)s. They often struggle with \(userInfo.they), but our product/service can help them with \(userInfo.point). We take pride in our \(userInfo.reservation) approach to business, and strive to create positive \(userInfo.interaction) with our customers. Our tone is typically \(userInfo.tone), and our style can be described as \(userInfo.style). DO NOT NUMBER THEM"
        let marketingBrief = "Write a marketing brief for a company with this mission: \(userInfo.mission). The values we hold dear are \(userInfo.values), and we believe our greatest advantage is \(userInfo.advantage). Our work involves \(userInfo.work), and our goals include \(userInfo.goals). We expect \(userInfo.expectation) from our customers, who are typically \(userInfo.age) year old \(userInfo.gender)s. They often struggle with \(userInfo.they), but our product/service can help them with \(userInfo.point). We take pride in our \(userInfo.reservation) approach to business, and strive to create positive \(userInfo.interaction) with our customers. Our tone is typically \(userInfo.tone), and our style can be described as \(userInfo.style)."

        
        print("api service manager")
        print("Before sendMessage(): \(cancellables)")

        APIServiceManager().sendMessage(message: twitter)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("Request completed successfully.")
                case .failure(let error):
                    print("Error: \(error)")
                }
            }, receiveValue: { response in
                print("Received response: \(response)")
                guard let textResponse = response.choices.first?.text.trimmingCharacters(in: .whitespacesAndNewlines.union(.init(charactersIn: "\""))) else {
                    print("Could not extract text response from API response.")
                    return
                }
                let chatAIMessage = MessageModel(id: response.id, content: textResponse, dateCreated: Date(), sender: .chatAI)
                self.chatMessages.append(chatAIMessage)
                AIResponse = textResponse
                
                textResponse.components(separatedBy: "\n").forEach {
                    string in
                    
                    print(string)
                    dataManager.postTwitters(Caption: string)
                    // Code to be executed for each string in the array
                }
                //parse here and call postinstagram
                //should call another method here to store in database
                print("Received message: \(chatAIMessage)")
                // Do something with the received message here
            })
            .store(in: &cancellables)
        
        APIServiceManager().sendMessage(message: instagram)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("Request completed successfully.")
                case .failure(let error):
                    print("Error: \(error)")
                }
            }, receiveValue: { response in
                print("Received response: \(response)")
                guard let textResponse = response.choices.first?.text.trimmingCharacters(in: .whitespacesAndNewlines.union(.init(charactersIn: "\""))) else {
                    print("Could not extract text response from API response.")
                    return
                }
                let chatAIMessage = MessageModel(id: response.id, content: textResponse, dateCreated: Date(), sender: .chatAI)
                self.chatMessages.append(chatAIMessage)
                AIResponse = textResponse
                textResponse.components(separatedBy: "\n").forEach { string in
                    
                    print(string)
                    dataManager.postInstagrams(Caption: string)
                    // Code to be executed for each string in the array
                }
                
            
              
                //parse here and call postinstagram
                //should call another method here to store in database
                print("Received message: \(chatAIMessage)")
                // Do something with the received message here
            })
            .store(in: &cancellables)
        
        APIServiceManager().sendMessage(message: facebook)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("Request completed successfully.")
                case .failure(let error):
                    print("Error: \(error)")
                }
            }, receiveValue: { response in
                print("Received response: \(response)")
                guard let textResponse = response.choices.first?.text.trimmingCharacters(in: .whitespacesAndNewlines.union(.init(charactersIn: "\""))) else {
                    print("Could not extract text response from API response.")
                    return
                }
                let chatAIMessage = MessageModel(id: response.id, content: textResponse, dateCreated: Date(), sender: .chatAI)
                self.chatMessages.append(chatAIMessage)
                AIResponse = textResponse
                //parse here and call postinstagram
                //should call another method here to store in database
                print("Received message: \(chatAIMessage)")
                textResponse.components(separatedBy: "\n").forEach { string in
                    
                    print(string)
                    dataManager.postFacebooks(Caption: string)
                    // Code to be executed for each string in the array
                }
                
                // Do something with the received message here
            })
            .store(in: &cancellables)
        
        //MARKETING BRIEF
        
        APIServiceManager().sendMessage(message: marketingBrief)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("Request completed successfully.")
                case .failure(let error):
                    print("Error: \(error)")
                }
            }, receiveValue: { response in
                print("Received response: \(response)")
                guard let textResponse = response.choices.first?.text.trimmingCharacters(in: .whitespacesAndNewlines.union(.init(charactersIn: "\""))) else {
                    print("Could not extract text response from API response.")
                    return
                }
                let chatAIMessage = MessageModel(id: response.id, content: textResponse, dateCreated: Date(), sender: .chatAI)
                self.chatMessages.append(chatAIMessage)
                AIResponse = textResponse
                //parse here and call postinstagram
                //should call another method here to store in database
                print("Received message: \(chatAIMessage)")
                dataManager.postMarketingBrief(Brief: textResponse)
                
                // Do something with the received message here
            })
            .store(in: &cancellables)

        print("After sendMessage(): \(cancellables)")

        
        print("Sent message: \(messageText)")
    }


}
struct WalkthroughView_Previews: PreviewProvider {
    static var previews: some View {
        WalkthroughView()
    }
}

