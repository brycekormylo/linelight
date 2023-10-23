//
//  ProfileView.swift
//  Fotofolio
//
//  Created by Bryce on 10/23/23.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var theme: ThemeController
    
    var body: some View {
        ZStack {
            ProfileHeader()
            VStack {
                info
                    .offset(y: 456)
                Spacer()
            }
        }
    }
    
    var info: some View {
        VStack {
            Text("Millie Worms")
                .font(.title)
            Text("Ball Photographer")
                .opacity(0.6)
            Text("Millie adores Charlie, their tails wagging furiously whenever they're together, and their playful antics create an unbreakable bond of canine affection. Their friendship is a heartwarming testament to the pure and unwavering love that dogs can have for one another.")
                .padding(.vertical, 8)
        }
        .foregroundStyle(theme.text)
        .padding(.horizontal)
    }
}

#Preview {
    ProfileView()
}
