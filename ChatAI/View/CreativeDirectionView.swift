//
//  CreativeDirectionView.swift
//  ChatAI
//
//  Created by Aniyah Norman on 2/21/23.
//

import SwiftUI
struct CreativeDirectionView: View {
    @EnvironmentObject var userInfo : UserInfo
    @State private var isPopoverPresentedTone = false
    @State private var isPopoverPresentedMessage = false
    @State private var isPopoverPresentedStyle = false
    var body: some View {
        ZStack {
            // insert background
            Color.white
            VStack (spacing: 20){
                
                Image("direction")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("Enter your brand’s")
                        Text("tone").foregroundColor(.blue.opacity(0.4))
                        Button(action: {
                            isPopoverPresentedTone = true
                        }) {
                            Image(systemName: "info.circle.fill")
                                .foregroundColor(Color("dairyBlue"))
                        }
                        .popover(isPresented: $isPopoverPresentedTone, arrowEdge: .top) {
                            VStack(alignment: .center) {
                                Text("Brand Tone")
                                    .font(.headline)
                                    .foregroundColor(Color("dairyBlue"))
                                    .padding(10)
                                Text("A brand's tone refers to the style, manner, and attitude conveyed through its communication and messaging. It reflects the brand's personality and influences how it is perceived by its target audience. The tone can range from formal and professional to casual and friendly, and it should be consistent across all brand touchpoints to establish a cohesive and authentic brand voice that resonates with customers.")
                                    .font(.body)
                                    .multilineTextAlignment(.center)
                                    .padding(10)
                                Text("Ex -- 'Informative, helpful, and trustworthy.'")
                                    .font(.subheadline)
                                    .multilineTextAlignment(.center)
                                Button(action: {
                                                        isPopoverPresentedTone = false
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
                    RoundedTextField(title: "Type here...", text: $userInfo.tone).offset(y: -15)
                }
                VStack(alignment: .leading) {
                    HStack {
                        Text("Enter your brand’s")
                        Text("message").foregroundColor(.blue.opacity(0.4))
                        Button(action: {
                            isPopoverPresentedMessage = true
                        }) {
                            Image(systemName: "info.circle.fill")
                                .foregroundColor(Color("dairyBlue"))
                        }
                        .popover(isPresented: $isPopoverPresentedMessage, arrowEdge: .top) {
                            VStack(alignment: .center) {
                                Text("Brand Message")
                                    .font(.headline)
                                    .foregroundColor(Color("dairyBlue"))
                                    .padding(10)
                                Text("A brand's message is the core communication that encapsulates its value proposition, unique selling points, and key brand attributes. It conveys the brand's purpose, benefits, and promises to its target audience. A well-crafted brand message should be clear, compelling, and memorable, effectively capturing the essence of the brand and resonating with customers to differentiate the brand from competitors and create a lasting impression.")
                                    .font(.body)
                                    .multilineTextAlignment(.center)
                                    .padding(10)
                                Text("Ex -- 'Our dairy products are fresh, organic, and sustainably sourced, and we prioritize quality, sustainability, and supporting local businesses.'")
                                    .font(.subheadline)
                                    .multilineTextAlignment(.center)
                                Button(action: {
                                                        isPopoverPresentedMessage = false
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
                    RoundedTextField(title: "Type here...", text: $userInfo.message).offset(y: -15)
                }
                VStack(alignment: .leading) {
                    HStack {
                        Text("Enter your brand’s")
                        Text("style ").foregroundColor(.blue.opacity(0.4))
                        Button(action: {
                            isPopoverPresentedStyle = true
                        }) {
                            Image(systemName: "info.circle.fill")
                                .foregroundColor(Color("dairyBlue"))
                        }
                        .popover(isPresented: $isPopoverPresentedStyle, arrowEdge: .top) {
                            VStack(alignment: .center) {
                                Text("Brand Style")
                                    .font(.headline)
                                    .foregroundColor(Color("dairyBlue"))
                                    .padding(10)
                                Text("A brand's style refers to its visual aesthetic and design elements that contribute to its overall look and feel. It encompasses the brand's logo, color palette, typography, imagery, and other visual components that create a consistent and recognizable visual identity. The brand's style sets the tone, evokes emotions, and helps shape customer perceptions, playing a crucial role in conveying the brand's personality and establishing a cohesive brand presence across various channels and touchpoints.")
                                    .font(.body)
                                    .multilineTextAlignment(.center)
                                    .padding(10)
                                Text("Ex -- 'Clean, modern, and professional design with high-quality images and videos that showcase the company's products and values.'")
                                    .font(.subheadline)
                                    .multilineTextAlignment(.center)
                                Button(action: {
                                                        isPopoverPresentedStyle = false
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
                    RoundedTextField(title: "Type here...", text: $userInfo.style).offset(y: -15)
                }
            }
            .frame(width: 350)
        }
    }
}
struct CreativeDirectionView_Previews: PreviewProvider {
    static let userInfo = UserInfo()
    static var previews: some View {
        CreativeDirectionView()
            .environmentObject(userInfo)
    }
}
