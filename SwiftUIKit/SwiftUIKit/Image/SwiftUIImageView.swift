//
//  SwiftUIImageView.swift
//  SwiftUIKit
//
//  Created by sawalon.chen on 2023/5/20.
//

import SwiftUI

struct SwiftUIImageView: View {
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "cloud.heavyrain")
                    .font(.system(size: 50))
                    .foregroundColor(.blue)
                    .shadow(color: .gray, radius: 10, x: 0, y: 10)
                    .overlay(alignment: .center, content: {
                        Image(systemName: "heart.fill")
                            .font(.system(size: 50))
                            .foregroundColor(.black)
                            .opacity(0.5)
                            .overlay(content: {
                                Text("Rain")
                                    .fontWeight(.black)
                                    .foregroundColor(.white)
                            })
                    })
                    .padding(4)

                Image(systemName: "cloud.sun.rain")
                    .font(.system(size: 50))
                    .symbolRenderingMode(.palette)
                    .foregroundStyle(.blue, .yellow, .gray)
                    .padding(4)
                
                Image(systemName: "slowmo", variableValue: 0.5)
                    .symbolRenderingMode(.palette)
                    .foregroundColor(.green)
                    .font(.system(size: 50))
                    .padding(4)
                
            }
            
            Image("paris")
                .resizable()
//                .scaledToFit()
//                .aspectRatio( contentMode: .fit)
                .aspectRatio( contentMode: .fill)
                .frame(width: 300)
//                .clipped()
//                .clipShape(Circle())
//                .ignoresSafeArea(.container, edges: .bottom)
//                .opacity(0.5)//不透明度，0 完全透明，1 完全不透明
                .overlay(content: {
                    Color.black
                        .opacity(0.4)
                })
                .overlay(alignment: .top, content: {
                    Text("If you are lucky enough to have lived in Paris as a young man, then wherever you go for the rest of your life it stays with you, for Paris is a moveable feast.\n\n- Ernest Hemingway")
                        .fontWeight(.heavy)
                        .font(.system(.headline, design: .rounded))
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.black)
                        .cornerRadius(10)
                        .opacity(0.8)
                        .padding()
                })
        }
        
//        Shadow()
    }
}

struct Shadow: View {
    let steps = [0, 5, 10]

    var body: some View {
        VStack(spacing: 50) {
            ForEach(steps, id: \.self) { offset in
                HStack(spacing: 50) {
                    ForEach(steps, id: \.self) { radius in
                        Color.blue
                            .shadow(
                                color: .primary,
                                radius: CGFloat(radius),
                                x: CGFloat(offset), y: CGFloat(offset))
                            .overlay {
                                VStack {
                                    Text("\(radius)")
                                    Text("(\(offset), \(offset))")
                                }
                            }
                    }
                }
            }
        }
        .padding()
    }
}

struct SwiftUIImageView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIImageView()
    }
}
