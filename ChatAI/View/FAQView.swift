//
//  FAQView.swift
//  ChatAI
//
//  Created by Aniyah Norman on 4/27/23.
//

import SwiftUI

struct FAQView: View {
    @Binding var currentView: Int
    var body: some View {
        ZStack {
            Image("signup_background")
                .resizable()
                .offset(y: 400)
            Image("signup_background")
                .resizable()
                .offset(y: -400)

            ScrollView {
                VStack(spacing: 30) {
                    Spacer()
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color("dairyGold"))
                        .frame(width: 300, height: 250)
                        .overlay {
                            VStack(alignment:.center) {
                                Text("Why Dairy?")
                                    .font(.system(size: 30))
                                    .bold()
                                Text("Marketing agencies often have unconventional names to standout and convey creativity and we're no different!  we want users to use our app to milk their content to the best of its ability, and dairy is step in the right direction.")
                                    .font(.system(size: 20))
                                    .multilineTextAlignment(.center)
                            }
                            .padding(10)
                        }
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color("dairyBlue"))
                        .frame(width: 300, height: 200)
                        .overlay {
                            VStack(alignment: .center) {
                                Text("Cost")
                                    .font(.system(size: 30))
                                    .bold()
                                Text("Dairy Market is currently free for all users to use.")
                                    .font(.system(size: 20))
                                    .multilineTextAlignment(.center)
                            }
                            .padding(10)
                        }
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color("dairyGold"))
                        .frame(width: 300, height: 250)
                        .overlay {
                            VStack(alignment: .center) {
                                Text("Tools Used")
                                    .font(.system(size: 30))
                                    .bold()
                                Text("Dairy Market utilizes ChatGPT-3 API for the AI functionality, Google Firebase for the database, and SwiftUI for the front-end and backend functionality.")
                                    .font(.system(size: 20))
                                    .multilineTextAlignment(.center)
                            }
                            .padding(10)
                        }
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color("dairyBlue"))
                        .frame(width: 300, height: 200)
                        .overlay {
                            VStack(alignment: .center) {
                                Text("Features")
                                    .font(.system(size: 30))
                                    .bold()
                                Text("Dairy Market features caption and post generation for popular media platforms, an AI marketing agent, and article homepage for education.")
                                    .font(.system(size: 20))
                                    .multilineTextAlignment(.center)
                            }
                            .padding(10)
                        }
                    Spacer()
                }
                .frame(width: 350)
            }
        }
    }
}

struct FAQView_Previews: PreviewProvider {
    static var previews: some View {
        FAQView(currentView: .constant(1))
    }
}
