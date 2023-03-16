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
        VStack(spacing: 30) {
            Spacer()
            ForEach((0...2), id: \.self) { _ in
                RoundedRectangle(cornerRadius: 20)
                    .fill(.gray)
                    .frame(width: 300, height: 160)
                    .overlay {
                        Text("Article 1")
                            .font(.system(size: 30))
                    }
            }
            Spacer()
        }
        .frame(width: 350)
    }
}
struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView(currentView: .constant(1))
    }
}

