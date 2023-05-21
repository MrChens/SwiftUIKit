//
//  SwiftUIStackView.swift
//  SwiftUIKit
//
//  Created by sawalon.chen on 2023/5/20.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 2) {
                Text("Choose")
                    .font(.system(.largeTitle, design: .rounded, weight: .black))
                Text("Your Plan")
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.black)
            }
            Spacer()
        }
        .padding()
    }
}

struct SwiftUIStackView: View {
    var body: some View {
        VStack(spacing: 15) {
            HeaderView()
            
            HStack(spacing: 15) {
                PricingView(
                    title: "Basic",
                    price: "$9",
                    textColor: .white,
                    bgColor: .purple
                )
                
                ZStack {
                    PricingView(
                        title: "Pro",
                        price: "$19",
                        textColor: .black,
                        bgColor: Color(red: 240/255, green: 240/255, blue: 240/255)
                    )
                    
                    Text("Best for designer")
                        .font(.system(.caption, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(5)
                        .background(Color(red: 255/255, green: 183/255, blue: 37/255))
                        .offset(x: 0, y: 87)
                }
            }
            
            PricingView(
                title: "Team",
                price: "$299",
                textColor: .white,
                bgColor: .black,
                icon: "wand.and.rays"
            )
            .overlay(alignment: .bottom, content: {
                Text("Perfect for teams with 20 members")
                    .font(.system(.caption, design: .rounded))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(5)
                    .background(Color.yellow)
                    .offset(x:0, y: 12)
            })
            
            
            Spacer()
        }
        .padding(.horizontal)
        
    }
}

struct SwiftUIStackView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIStackView()
    }
}



struct PricingView: View {
    var title: String
    var price: String
    var textColor: Color
    var bgColor: Color
    var icon: String?
    
    var body: some View {
        VStack {
            if let icon = icon {
                Image(systemName: icon)
                    .font(.largeTitle)
                    .foregroundColor(textColor)
            }
            
            Text(title)
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
                .foregroundColor(textColor)
            Text(price)
                .font(.system(size: 40, weight: .heavy, design: .rounded))
                .foregroundColor(textColor)
            Text("Per month")
                .font(.headline)
                .foregroundColor(textColor)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 100)
        .padding(40)
        .background(bgColor)
        .cornerRadius(10)
    }
}
