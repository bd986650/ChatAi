//
//  CustomerNeedsView.swift
//  ChatAI
//
//  Created by Aniyah Norman on 2/21/23.
//

import SwiftUI
struct CustomerNeedsView: View {

    @EnvironmentObject var userInfo : UserInfo
    @State private var isPopoverPresentedPainPoints = false
    @State private var isPopoverPresentedReservations = false
    @State private var isPopoverPresentedInteraction = false
    var body: some View {
        ZStack {
            // insert background
            Color.white
            VStack (spacing: 20){
                
                Image("needs")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("What are their current")
                        Text("pain points?   ").foregroundColor(.blue.opacity(0.4))
                        Button(action: {
                            isPopoverPresentedPainPoints = true
                        }) {
                            Image(systemName: "info.circle.fill")
                                .foregroundColor(Color("dairyBlue"))
                        }
                        .popover(isPresented: $isPopoverPresentedPainPoints, arrowEdge: .top) {
                            VStack(alignment: .center) {
                                Text("Customer Pain Points")
                                    .font(.headline)
                                    .foregroundColor(Color("dairyBlue"))
                                    .padding(10)
                                Text("A brand's customer pain points are the specific challenges, problems, or frustrations that its target customers experience. These pain points represent areas where customers encounter difficulties, unmet needs, or dissatisfaction with existing solutions. Understanding and addressing these pain points is crucial for a brand to provide valuable and differentiated offerings that effectively alleviate customer struggles, enhance their experience, and establish a competitive advantage in the market.")
                                    .font(.body)
                                    .multilineTextAlignment(.center)
                                    .padding(10)
                                Text("Ex -- 'Difficulty finding locally sourced, fresh dairy products; lack of convenience when shopping for groceries; concerns about the quality and sustainability of dairy products.'")
                                    .font(.subheadline)
                                    .multilineTextAlignment(.center)
                                Button(action: {
                                                        isPopoverPresentedPainPoints = false
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
                    RoundedTextField(title: "Type here...", text: $userInfo.point).offset(y: -15)
                }
                VStack(alignment: .leading) {
                    HStack {
                        Text("Do they have any")
                        Text("reservations?").foregroundColor(.blue.opacity(0.4))
                        Button(action: {
                            isPopoverPresentedReservations = true
                        }) {
                            Image(systemName: "info.circle.fill")
                                .foregroundColor(Color("dairyBlue"))
                        }
                        .popover(isPresented: $isPopoverPresentedReservations, arrowEdge: .top) {
                            VStack(alignment: .center) {
                                Text("Customer Reservations")
                                    .font(.headline)
                                    .foregroundColor(Color("dairyBlue"))
                                    .padding(10)
                                Text("A brand's customer reservations refer to the hesitations, doubts, or concerns that potential customers may have before making a purchase or engaging with the brand. These reservations can be related to factors such as product quality, pricing, trustworthiness, customer support, or compatibility with their needs. Addressing and mitigating these reservations through transparent communication, testimonials, guarantees, or risk-reducing strategies is essential for building trust, overcoming barriers, and converting potential customers into loyal brand advocates.")
                                    .font(.body)
                                    .multilineTextAlignment(.center)
                                    .padding(10)
                                Text("Ex -- 'Concerns about the cost of organic and locally sourced products; concerns about the convenience and speed of delivery.'")
                                    .font(.subheadline)
                                    .multilineTextAlignment(.center)
                                Button(action: {
                                                        isPopoverPresentedReservations = false
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
                    RoundedTextField(title: "Type here...", text: $userInfo.reservation).offset(y: -15)
                }
                VStack(alignment: .leading) {
                    HStack {
                        Text("Enter goals related to")
                        Text("interaction ").foregroundColor(.blue.opacity(0.4))
                        Button(action: {
                            isPopoverPresentedInteraction = true
                        }) {
                            Image(systemName: "info.circle.fill")
                                .foregroundColor(Color("dairyBlue"))
                        }
                        .popover(isPresented: $isPopoverPresentedInteraction, arrowEdge: .top) {
                            VStack(alignment: .center) {
                                Text("Customer Interactions")
                                    .font(.headline)
                                    .foregroundColor(Color("dairyBlue"))
                                    .padding(10)
                                Text("A brand's customer interactions encompass all the touchpoints and engagements between the brand and its customers. These interactions can occur through various channels such as in-person interactions, customer service interactions, social media interactions, or online purchases. Effective customer interactions involve delivering personalized experiences, providing prompt and helpful support, and fostering positive relationships to enhance customer satisfaction, loyalty, and advocacy.")
                                    .font(.body)
                                    .multilineTextAlignment(.center)
                                    .padding(10)
                                Text("Ex -- 'To find high-quality, fresh, and sustainably sourced dairy products in a convenient and user-friendly manner.'")
                                    .font(.subheadline)
                                    .multilineTextAlignment(.center)
                                Button(action: {
                                                        isPopoverPresentedInteraction = false
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
                    RoundedTextField(title: "Type here...", text: $userInfo.interaction).offset(y: -15)
                }
            }
            .frame(width: 350)
        }
    }
}
struct CustomerNeedsView_Previews: PreviewProvider {
    static let userInfo = UserInfo()
    static var previews: some View {
        CustomerNeedsView()
            .environmentObject(userInfo)
    }
}
