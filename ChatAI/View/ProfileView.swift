//
//  ProfileView.swift
//  ChatAI
//
//  Created by Aniyah Norman on 2/23/23.
//

import SwiftUI
struct ProfileView: View {
    
    var name = "Name"
    var brandName = "Brand Name"
    @State private var showSheet = false
    @Binding var currentView: Int
    
    var body: some View {
        
        VStack(spacing: 20) {
            Spacer()
            HStack(spacing: 20) {
                Image(systemName: "person.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50)
                
                Text(name + " / " + brandName)
            }
            .offset(x: -50)
            .fixedSize()
            
            Text("MY PROJECTS")
                .foregroundColor(.blue)
                .padding(.vertical, 10)
                .padding(.horizontal, 40)
                .frame(width: 200)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(.blue)
                )
            
            HStack {
                VStack(alignment: .center) {
                    Text("BRAND")
                        .frame(height: 30)
                    Text("MARKETING GOALS")
                        .frame(height: 30)
                    Text("CUSTOMER")
                        .frame(height: 30)
                    Text("CREATIVE DIRECTION")
                        .frame(height: 30)
                }
                
                VStack {
                    ForEach((0...3), id: \.self) { i in
                        HStack {
                            Text("view")
                                .font(.system(size: 14))
                                .padding(.vertical, 5)
                                .frame(width: 60)
                                .background(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(.blue)
                                )
                            Text("modify")
                                .font(.system(size: 14))
                                .padding(.vertical, 5)
                                .frame(width: 60)
                                .background(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(.blue)
                                )
                        }
                        .frame(height: 30)
                    }
                }
            }
            
            Spacer()
            
            Text("View my marketing strategy")
                .foregroundColor(.blue)
                .onTapGesture {
                    withAnimation {
                        self.showSheet.toggle()
                    }
                }
            
            PopupView(showSheet: $showSheet)
        }
        .frame(width: 350)
    }
}
struct PopupView: View {
    
    @Binding var showSheet: Bool
    
    var body: some View {
        
        VStack {
            Text("MY MARKETING STRATEGY")
                .padding(.top, 50)
            Spacer()
        }
        .frame(height: 330)
        .frame(width: UIScreen.main.bounds.width)
        .background(.gray)
        .clipShape(RoundedRectangle(cornerRadius: 80))
        .offset(y: (showSheet ? 100 : 500))
    }
}
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(currentView: .constant(0))
    }
}


