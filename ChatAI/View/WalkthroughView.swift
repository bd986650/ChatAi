//
//  WalkthroughView.swift
//  ChatAI
//
//  Created by Aniyah Norman on 3/16/23.
//

import SwiftUI
var totalViews = 5
struct WalkthroughView: View {
    
    @State var currentView = 1
    
    var body: some View {
        VStack {
            // Text("\(currentView)")
            if currentView != 6 {
                WalkthroughScreen(current: $currentView)
            } else {
                ProfileandHomePageView()
            }
        }
    }
}
struct WalkthroughScreen: View {
    @Binding var current: Int
  
    var body: some View {
        ZStack{
            VStack{
                Group {
                    if current == 1 {
                        BrandInfoView()
                    } else if current == 2 {
                        GoalInfoView()
                    } else if current == 3 {
                        CustomerInfoView()
                    } else if current == 4 {
                        CustomerNeedsView()
                    } else {
                        CreativeDirectionView()
                    }
                }.padding()
                
                Button(
                    action:{
                        withAnimation {
                            if current <= totalViews  {
                                current += 1
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
}
struct WalkthroughView_Previews: PreviewProvider {
    static var previews: some View {
        WalkthroughView()
    }
}

