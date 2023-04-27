//
//  BrandInfoView.swift
//  ChatAI
//
//  Created by Aniyah Norman on 2/21/23.
//

import SwiftUI
struct BrandInfoView: View {
    @EnvironmentObject var userInfo : UserInfo
    @State private var userIsLoggedIn = false
    @State private var isPopoverPresentedMission = false
    @State private var isPopoverPresentedValue = false
    @State private var isPopoverPresentedAdv = false
    
    var body: some View {
        ZStack {
            // insert background
            Color.white
            VStack (spacing: 20){
                // logo
                Image("brand")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
               
                VStack(alignment: .leading) {
                    HStack {
                        Text("What is your brand’s")
                        Text("mission? ").foregroundColor(Color("dairyBlue"))
                            .bold()
                        Button(action: {
                            isPopoverPresentedMission = true
                        }) {
                            Image(systemName: "info.circle.fill")
                                .foregroundColor(Color("dairyBlue"))
                        }
                        .popover(isPresented: $isPopoverPresentedMission, arrowEdge: .top) {
                            VStack(alignment: .center) {
                                Text("Brand Mission")
                                    .font(.headline)
                                    .foregroundColor(Color("dairyBlue"))
                                    .padding(10)
                                Text("A brand mission, also known as a mission statement, is a succinct declaration that communicates a brand's purpose, values, and goals. It serves as a guiding principle, informing the brand's actions and direction while reflecting its unique position in the market and the positive impact it aims to make. A well-crafted mission statement establishes a brand's identity, inspires stakeholders, and provides a clear sense of purpose and direction for the brand's strategy and decision-making.")
                                    .font(.body)
                                    .multilineTextAlignment(.center)
                                    .padding(10)
                                Text("Ex -- 'to provide fresh sourced dairy products to health-conscious families while supporting local farming communities.'")
                                    .font(.subheadline)
                                    .multilineTextAlignment(.center)
                                Button(action: {
                                                        isPopoverPresentedMission = false
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
                    RoundedTextField(title: "Type here...", text: $userInfo.mission).offset(y: -15)
                }
                VStack(alignment: .leading) {
                    HStack {
                        Text("What is your brand’s")
                        Text("values? ").foregroundColor(.blue.opacity(0.4))
                        Button(action: {
                            isPopoverPresentedValue = true
                        }) {
                            Image(systemName: "info.circle.fill")
                                .foregroundColor(Color("dairyBlue"))
                        }
                        .popover(isPresented: $isPopoverPresentedValue, arrowEdge: .top) {
                            VStack(alignment: .center) {
                                Text("Brand Values")
                                    .font(.headline)
                                    .foregroundColor(Color("dairyBlue"))
                                    .padding(10)
                                Text("Brand value refers to the worth and significance a brand holds in the eyes of its target audience and stakeholders. It represents the unique qualities, attributes, and benefits that differentiate a brand from its competitors. Brand value encompasses factors such as brand reputation, customer loyalty, perceived quality, and emotional connection, all of which contribute to the brand's overall worth and market position.")
                                    .font(.body)
                                    .multilineTextAlignment(.center)
                                    .padding(10)
                                Text("Ex -- 'transparency, sustainability, and quality in everything we do.'")
                                    .font(.subheadline)
                                    .multilineTextAlignment(.center)
                                Button(action: {
                                    isPopoverPresentedValue = false
                                    
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
                    RoundedTextField(title: "Type here...", text: $userInfo.values).offset(y: -15)
                }
                VStack(alignment: .leading) {
                    HStack {
                        Text("What is your")
                        Text("competitive advantage? ").foregroundColor(.blue.opacity(0.4))
                        Button(action: {
                            isPopoverPresentedAdv = true
                        }) {
                            Image(systemName: "info.circle.fill")
                                .foregroundColor(Color("dairyBlue"))
                        }
                        .popover(isPresented: $isPopoverPresentedAdv, arrowEdge: .top) {
                            VStack(alignment: .center) {
                                Text("Competitive Advantage")
                                    .font(.headline)
                                    .foregroundColor(Color("dairyBlue"))
                                    .padding(10)
                                Text("Brand competitive advantage refers to the unique attributes or strengths that set a brand apart from its competitors and give it an edge in the market. It encompasses factors such as product differentiation, innovation, pricing strategies, customer service, and brand reputation. A brand's competitive advantage allows it to outperform rivals, attract and retain customers, and achieve sustainable success in its industry.")
                                    .font(.body)
                                    .multilineTextAlignment(.center)
                                    .padding(10)
                                Text("Ex -- 'organic, locally sourced, and free from preservatives and hormones, which sets us apart from other dairy delivery services.'")
                                    .font(.subheadline)
                                    .multilineTextAlignment(.center)
                                Button(action: {
                                                        isPopoverPresentedAdv = false
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
                    RoundedTextField(title: "Type here...", text: $userInfo.advantage).offset(y: -15)
                }
            }
            .frame(width: 350)
        }
    }
    
    static func send() {
        
    }
}


struct BrandView_Previews: PreviewProvider {
    static let userInfo = UserInfo()
    static var previews: some View {
        BrandInfoView()
            .environmentObject(userInfo)
    }
}
