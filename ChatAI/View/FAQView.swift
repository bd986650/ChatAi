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
        ScrollView {
            VStack(spacing: 30) {
                Spacer()
                RoundedRectangle(cornerRadius: 20)
                    .fill(.gray)
                    .frame(width: 300, height: 160)
                    .overlay {
                        Text("Article 4000")
                            .font(.system(size: 30))
                    }
                RoundedRectangle(cornerRadius: 20)
                    .fill(.gray)
                    .frame(width: 300, height: 160)
                    .overlay {
                        Text("Article 4000")
                            .font(.system(size: 30))
                    }
                RoundedRectangle(cornerRadius: 20)
                    .fill(.gray)
                    .frame(width: 300, height: 160)
                    .overlay {
                        Text("Article 4000")
                            .font(.system(size: 30))
                    }
                RoundedRectangle(cornerRadius: 20)
                    .fill(.gray)
                    .frame(width: 300, height: 160)
                    .overlay {
                        Text("Article 4000")
                            .font(.system(size: 30))
                    }
                Spacer()
            }
            .frame(width: 350)
        }
    }
}

struct FAQView_Previews: PreviewProvider {
    static var previews: some View {
        FAQView(currentView: .constant(1))
    }
}
