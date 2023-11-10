//
//  Button.swift
//  ColorBlindSubwaySP
//
//  Created by Caroline Stelitano on 09/11/23.
//

import SwiftUI

struct NavigationButton<LinkView:View>: View {
    let image: String
    let text: String
    let link: LinkView
    
    var body: some View {
        NavigationLink {
            link
        } label: {
            HStack {
                Image(systemName: image)
                    .foregroundColor(.black)
                    .font(.system(size: 20))
                Text(text)
                    .font(.system(size: 20, weight: .medium, design: .rounded))
                    .foregroundColor(Color(red: 0.05, green: 0.03, blue: 0))
            }
            .padding(20)
            .frame(maxWidth: .infinity)
            .background(Color(red: 0.82, green: 0.91, blue: 0.91))
            .cornerRadius(35)
        }
    
    }
}
