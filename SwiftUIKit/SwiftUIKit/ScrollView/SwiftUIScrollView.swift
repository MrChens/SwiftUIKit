//
//  SwiftUIScrollView.swift
//  SwiftUIKit
//
//  Created by sawalon.chen on 2023/5/21.
//

import SwiftUI

struct SwiftUIScrollView: View {
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("monday, agu 20".uppercased())
                        .font(.headline)
                        .foregroundColor(.secondary)
                    
                    Text("Your Reading")
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(.primary)
                }
                Spacer()
            }
            .padding([.top, .horizontal])
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    Group {
                        CardView(image: "swiftui-button", category: "SwiftUI", heading: "Drawing a Border with Rounded Corners", author: "Simon Ng")
//                            .frame(width: 300)
                        CardView(image: "macos-programming", category: "macOS", heading: "Building a Simple Editing App", author: "Gabriel Theodoropoulos")
//                            .frame(width: 300)
                        CardView(image: "flutter-app", category: "Flutter", heading: "Building a Complex Layout with Flutter", author: "Lawrence Tan")
//                            .frame(width: 300)
                        CardView(image: "natural-language-api", category: "iOS", heading: "What's New in Natural Language API", author: "Sai Kambampati")
//                            .frame(width: 300)
                    }
                    .frame(width: 300)
                }
            }
            Spacer()
        }
    }
}

struct SwiftUIScrollView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIScrollView()
    }
}
