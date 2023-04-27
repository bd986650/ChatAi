//
//  HomePageView.swift
//  ChatAI
//
//  Created by Aniyah Norman on 3/16/23.
//

import SwiftUI
struct HomePageView: View {
    
    @Binding var currentView: Int
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                Spacer()
                RoundedRectangle(cornerRadius: 20)
                    .fill(.gray)
                    .frame(width: 300, height: 160)
                    .overlay {
                        Text("Article 1")
                            .font(.system(size: 30))
                    }
                RoundedRectangle(cornerRadius: 20)
                    .fill(.gray)
                    .frame(width: 300, height: 160)
                    .overlay {
                        Text("Article 2")
                            .font(.system(size: 30))
                    }
                RoundedRectangle(cornerRadius: 20)
                    .fill(.gray)
                    .frame(width: 300, height: 160)
                    .overlay {
                        Text("Article 3")
                            .font(.system(size: 30))
                    }
                RoundedRectangle(cornerRadius: 20)
                    .fill(.gray)
                    .frame(width: 300, height: 160)
                    .overlay {
                        Text("Article 4")
                            .font(.system(size: 30))
                    }
                Spacer()
            }
            .frame(width: 350)
        }
    }
}


struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView(currentView: .constant(1))
    }
}

