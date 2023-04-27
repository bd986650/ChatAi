//
//  ProfileandHomePageView.swift
//  ChatAI
//
//  Created by Aniyah Norman on 3/16/23.
//

import SwiftUI
struct ProfileandHomePageView: View {
    @EnvironmentObject var dataManager: DataManager
    @State var currentView = 0
    var body: some View {
        NavigationView {
            ZStack {
                if currentView == 0 {
                    ProfileView(currentView: $currentView)
                        .environmentObject(dataManager)
                } else {
                    HomePageView(currentView: $currentView)
                }
                Spacer()
                HStack(spacing: 50) {
                    if currentView == 0 {
                        CircleButton(title: "homepage")
                            .onTapGesture {
                                withAnimation {
                                    currentView = 1
                                }
                            }
                    } else {
                        CircleButton(title: "Profile")
                            .onTapGesture {
                                withAnimation {
                                    currentView = 0
                                }
                            }
                    }
                    CircleButton(title: "+", size: 50)
                    CircleButton(title: "chatbot")
                }
                .frame(width: 360)
                .position(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.maxY - 150)
            }
            
         
        }
        
                
    }
}
struct CircleButton: View {
    var title: String
    var size: CGFloat = 14
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 80, height: 80)
                .foregroundColor(Color(red: 217/255, green: 217/255, blue: 217/255))
            if title == "chatbot" {
                NavigationLink(destination: HomeView(viewModel: ViewModel())) {
                    Text(title)
                        .font(.system(size: size))
                        .fontWeight(.light)
                }
            } else {
                Text(title)
                    .font(.system(size: size))
                    .fontWeight(.light)
            }
        }
    }
}
struct ProfileandHomePageView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileandHomePageView()
     //   CircleButton(title: "homepage")
    }
}

