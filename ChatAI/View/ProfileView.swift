//
//  ProfileView.swift
//  ChatAI
//
//  Created by Aniyah Norman on 2/23/23.
//

import SwiftUI

struct ProfileView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var userIsLoggedIn = false
    var body: some View {
        if userIsLoggedIn {
            content
            //ListView()
//            ListView()
//               .environmentObject(DataManager())
        } else {
            content
        }
    }
    
    var content: some View {
        ZStack{
            Color.white
            VStack {
                Text("hello world")
            }
        }
    }
    
    
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}


