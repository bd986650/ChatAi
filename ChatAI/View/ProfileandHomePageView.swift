//
//  ProfileandHomePageView.swift
//  ChatAI
//
//  Created by Aniyah Norman on 3/16/23.
//

import SwiftUI
struct ProfileandHomePageView: View {
    @State var profileImage: Image? = Image(systemName: "person.circle")
    @EnvironmentObject var dataManager: DataManager
    @State var currentView = 0
    @State var image = "newspaper.fill"
    @State var image2 = "questionmark.square.dashed"
    var body: some View {
        NavigationView {
            ZStack {
                if currentView == 0 {
                    ProfileView(currentView: $currentView)
                        .environmentObject(dataManager)
                } else if currentView == 2 {
                    FAQView(currentView: $currentView)
                } else {
                    HomePageView(currentView: $currentView)
                }
                Spacer()
                ZStack {
                    RoundedRectangle(cornerRadius: 50)
                        .fill(LinearGradient(colors: [Color("dairyGold"), Color("dairyBlue")], startPoint: .leading, endPoint: .trailing))
                        .frame(width: 400, height: 160)
                        .offset(y: 350)
//                        .foregroundColor(Color("dairyBlue"))
                    HStack(spacing: 50) {
                        if currentView == 0 {
                            CircleButton(title: "Info page", img: image)
                                .onTapGesture {
                                    withAnimation {
                                        image = "person.fill"
                                        currentView = 1
                                    }
                                }
                        } else {
                            CircleButton(title: "Profile", img: image)
                                .onTapGesture {
                                    withAnimation {
                                        image = "newspaper.fill"
                                        currentView = 0
                                    }
                                }
                        }
                        CircleButton(title: "AI Agent")
                        if currentView == 0 {
                            CircleButton(title: "FAQ", img: image2)
                                .onTapGesture {
                                    withAnimation {
                                        image2 = "person.fill"
                                        currentView = 2
                                    }
                                }
                        } else {
                            CircleButton(title: "Profile", img: image2)
                                .onTapGesture {
                                    withAnimation {
                                        image2 = "questionmark.square.dashed"
                                        currentView = 0
                                    }
                                }
                        }
                    }
                    .frame(width: 360)
                .position(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.maxY - 130)
                }
            }
            
         
        }
        
                
    }
}
struct CircleButton: View {
    var title: String
    var img = "newspaper.fill"
    var size: CGFloat = 14
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 80, height: 80)
                .foregroundColor(.gray.opacity(0.5))
            if title == "AI Agent" {
                NavigationLink(destination: HomeView(viewModel: ViewModel())) {
                    Image(systemName: "bubble.left.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.black.opacity(0.8))
                }
            } else if(title == "Info page" || title == "Profile") {
                Image(systemName: img)
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.black.opacity(0.8))
            } else if (title == "FAQ" || title == "Profile"){
                Image(systemName: img)
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.black.opacity(0.8))
            }
        }
    }
}
struct ProfileandHomePageView_Previews: PreviewProvider {
    static let dataManager = DataManager()
    static var previews: some View {
        ProfileandHomePageView()
            .environmentObject(dataManager)
     //   CircleButton(title: "homepage")
    }
}

