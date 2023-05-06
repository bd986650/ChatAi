//
//  GoalInfoView.swift
//  ChatAI
//
//  Created by Aniyah Norman on 2/21/23.
//

import SwiftUI
struct GoalInfoView: View {
    
    @EnvironmentObject var userInfo : UserInfo
    @State private var userIsLoggedIn = false
    @State private var isPopoverPresentedScope = false
    @State private var isPopoverPresentedGoals = false
    @State private var isPopoverPresentedExpectations = false
    var body: some View {
        ZStack {
            // insert background
            Color.white
            VStack (spacing: 20){
                
                Image("goal")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("Enter your")
                        Text("scope of work ").foregroundColor(.blue.opacity(0.4))
                        Button(action: {
                            isPopoverPresentedScope = true
                        }) {
                            Image(systemName: "info.circle.fill")
                                .foregroundColor(Color("dairyBlue"))
                        }
                        .popover(isPresented: $isPopoverPresentedScope, arrowEdge: .top) {
                            VStack(alignment: .center) {
                                Text("Scope of Work")
                                    .font(.headline)
                                    .foregroundColor(Color("dairyBlue"))
                                    .padding(10)
                                Text("Brand scope of work refers to the specific tasks, responsibilities, and deliverables associated with managing and developing a brand. It encompasses activities such as brand strategy development, brand positioning, brand identity design, marketing and communication campaigns, brand guidelines creation, and brand performance monitoring. The brand scope of work outlines the comprehensive range of brand-related activities and serves as a roadmap for building and maintaining a strong brand presence.")
                                    .font(.body)
                                    .multilineTextAlignment(.center)
                                    .padding(10)
                                Text("Ex -- 'Develop a user-friendly website that offers an easy-to-use ordering system for our dairy products and build brand awareness through social media marketing and email campaigns.'")
                                    .font(.subheadline)
                                    .multilineTextAlignment(.center)
                                Button(action: {
                                                        isPopoverPresentedScope = false
                                                    }) {
                                                        Text("Close")
                                                            .foregroundColor(Color("dairyBlue"))
                                                            .font(.headline)
                                                            .padding()
                                                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.2)))
                                                    }
                            }
                            .padding()
                        }
                    }.offset(x: 25)
                    RoundedTextField(title: "Type here...", text: $userInfo.work).offset(y: -15)
                }
                VStack(alignment: .leading) {
                    HStack {
                        Text("What are your")
                        Text("marketing goals?").foregroundColor(.blue.opacity(0.4))
                        Button(action: {
                            isPopoverPresentedGoals = true
                        }) {
                            Image(systemName: "info.circle.fill")
                                .foregroundColor(Color("dairyBlue"))
                        }
                        .popover(isPresented: $isPopoverPresentedGoals, arrowEdge: .top) {
                            VStack(alignment: .center) {
                                Text("Marketing Goals")
                                    .font(.headline)
                                    .foregroundColor(Color("dairyBlue"))
                                    .padding(10)
                                Text("Brand marketing goals are the specific objectives a brand aims to achieve through its marketing efforts. These goals typically revolve around increasing brand awareness, expanding customer reach and engagement, and driving conversions or sales. By setting clear and measurable brand marketing goals, companies can effectively plan and execute their marketing strategies to enhance brand visibility, cultivate customer loyalty, and achieve long-term business growth.")
                                    .font(.body)
                                    .multilineTextAlignment(.center)
                                    .padding(10)
                                Text("Ex -- 'Increase online sales by 20% in the first year and build a loyal customer base.'")
                                    .font(.subheadline)
                                    .multilineTextAlignment(.center)
                                Button(action: {
                                                        isPopoverPresentedGoals = false
                                                    }) {
                                                        Text("Close")
                                                            .foregroundColor(Color("dairyBlue"))
                                                            .font(.headline)
                                                            .padding()
                                                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.2)))
                                                    }
                            }
                            .padding()
                        }
                    }.offset(x: 25)
                    RoundedTextField(title: "Type here...", text: $userInfo.goals).offset(y: -15)
                }
                VStack(alignment: .leading) {
                    HStack {
                        Text("What are your")
                        Text("expectations? ").foregroundColor(.blue.opacity(0.4))
                        Button(action: {
                            isPopoverPresentedExpectations = true
                        }) {
                            Image(systemName: "info.circle.fill")
                                .foregroundColor(Color("dairyBlue"))
                        }
                        .popover(isPresented: $isPopoverPresentedExpectations, arrowEdge: .top) {
                            VStack(alignment: .center) {
                                Text("Expectations")
                                    .font(.headline)
                                    .foregroundColor(Color("dairyBlue"))
                                    .padding(10)
                                Text("Brand expectations refer to the set of beliefs, perceptions, and anticipations that consumers hold towards a brand. These expectations are shaped by the brand's reputation, marketing communications, product quality, and customer experiences. Meeting or exceeding these brand expectations is crucial for building trust, fostering customer loyalty, and establishing a positive brand image in the marketplace. Brands must consistently deliver on their promises and align their offerings with customer expectations to maintain a strong and sustainable relationship with their target audience.")
                                    .font(.body)
                                    .multilineTextAlignment(.center)
                                    .padding(10)
                                Text("Ex -- 'Low brand recognition and lack of a strong online presence.'")
                                    .font(.subheadline)
                                    .multilineTextAlignment(.center)
                                Button(action: {
                                                        isPopoverPresentedExpectations = false
                                                    }) {
                                                        Text("Close")
                                                            .foregroundColor(Color("dairyBlue"))
                                                            .font(.headline)
                                                            .padding()
                                                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.2)))
                                                    }
                            }
                            .padding()
                        }
                    }.offset(x: 25)
                    RoundedTextField(title: "Type here...", text: $userInfo.expectation).offset(y: -15)
                }
            }
            .frame(width: 350)
        }
    }
}
struct GoalView_Previews: PreviewProvider {
    static let userInfo = UserInfo()
    static var previews: some View {
        GoalInfoView()
            .environmentObject(userInfo)
    }
}
