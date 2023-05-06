//
//  CustomerInfoView.swift
//  ChatAI
//
//  Created by Aniyah Norman on 2/21/23.
//

import SwiftUI
struct CustomerInfoView: View {
 
    @EnvironmentObject var userInfo : UserInfo
    @State private var isPopoverPresentedAge = false
    @State private var isPopoverPresentedGender = false
    @State private var isPopoverPresentedSentence = false
    var body: some View {
        ZStack {
            // insert background
            Color.white
            VStack (spacing: 20){
                
                Image("target")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("What is your")
                        Text("target customer’s age?   ").foregroundColor(.blue.opacity(0.4))
                        Button(action: {
                            isPopoverPresentedAge = true
                        }) {
                            Image(systemName: "info.circle.fill")
                                .foregroundColor(Color("dairyBlue"))
                        }
                        .popover(isPresented: $isPopoverPresentedAge, arrowEdge: .top) {
                            VStack(alignment: .center) {
                                Text("Customer Age")
                                    .font(.headline)
                                    .foregroundColor(Color("dairyBlue"))
                                    .padding(10)
                                Text("Brand target age refers to the specific age range or demographic segment that a brand aims to appeal to and cater its products or services towards. It helps define the brand's target audience and guides its marketing strategies and messaging. Understanding the target age enables brands to tailor their offerings, communication channels, and branding elements to effectively resonate with and meet the needs of their intended age group.")
                                    .font(.body)
                                    .multilineTextAlignment(.center)
                                    .padding(10)
                                Text("Ex -- '25-55.'")
                                    .font(.subheadline)
                                    .multilineTextAlignment(.center)
                                Button(action: {
                                                        isPopoverPresentedAge = false
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
                    RoundedTextField(title: "Type here...", text: $userInfo.age).offset(y: -15)
                }
                VStack(alignment: .leading) {
                    HStack {
                        Text("Gender")
                        Text("identity?").foregroundColor(.blue.opacity(0.4))
                        Button(action: {
                            isPopoverPresentedGender = true
                        }) {
                            Image(systemName: "info.circle.fill")
                                .foregroundColor(Color("dairyBlue"))
                        }
                        .popover(isPresented: $isPopoverPresentedGender, arrowEdge: .top) {
                            VStack(alignment: .center) {
                                Text("Customer Gender Identity")
                                    .font(.headline)
                                    .foregroundColor(Color("dairyBlue"))
                                    .padding(10)
                                Text("Brand target gender identity refers to the specific gender identities or gender-related preferences that a brand aims to appeal to and engage with in its marketing efforts. It involves understanding and targeting specific gender identities such as male, female, or non-binary. By recognizing and respecting diverse gender identities, brands can create inclusive messaging, products, and experiences that resonate with their intended audience and foster a sense of belonging and representation.")
                                    .font(.body)
                                    .multilineTextAlignment(.center)
                                    .padding(10)
                                Text("Ex -- 'All genders.'")
                                    .font(.subheadline)
                                    .multilineTextAlignment(.center)
                                Button(action: {
                                                        isPopoverPresentedGender = false
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
                    RoundedTextField(title: "Type here...", text: $userInfo.gender).offset(y: -15)
                }
                VStack(alignment: .leading) {
                    HStack {
                        Text("In one sentence,")
                        Text("who are they? ").foregroundColor(.blue.opacity(0.4))
                        Button(action: {
                            isPopoverPresentedSentence = true
                        }) {
                            Image(systemName: "info.circle.fill")
                                .foregroundColor(Color("dairyBlue"))
                        }
                        .popover(isPresented: $isPopoverPresentedSentence, arrowEdge: .top) {
                            VStack(alignment: .center) {
                                Text("Who is your customer")
                                    .font(.headline)
                                    .foregroundColor(Color("dairyBlue"))
                                    .padding(10)
                                Text("A sentence describing a brand's target customer typically provides a brief overview of the ideal consumer profile the brand aims to attract. It includes key demographic information, psychographic characteristics, and relevant preferences or behaviors. The sentence should convey a clear understanding of the target customer and help guide the brand's marketing strategies and communication efforts towards effectively reaching and engaging with this specific audience segment.")
                                    .font(.body)
                                    .multilineTextAlignment(.center)
                                    .padding(10)
                                Text("Ex -- 'Our target customers are people who value quality, sustainability, and supporting local businesses.'")
                                    .font(.subheadline)
                                    .multilineTextAlignment(.center)
                                Button(action: {
                                                        isPopoverPresentedSentence = false
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
                    RoundedTextField(title: "Type here...", text: $userInfo.they).offset(y: -15)
                }
            }
            .frame(width: 350)
        }
    }
}
struct CustomerInfoView_Previews: PreviewProvider {
    static let userInfo = UserInfo()
    static var previews: some View {
        CustomerInfoView()
            .environmentObject(userInfo)
    }
}
