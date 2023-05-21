//
//  SwiftUITextView.swift
//  SwiftUIKit
//
//  Created by sawalon.chen on 2023/5/20.
//

import SwiftUI

struct SwiftUITextView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
                .padding(4)

            Text("**This is how you bold a text**. *This is how you make text italic.* You can [click this link](https://www.appcoda.com) to go to appcoda.com")
                .fontWeight(.bold)
//                .font(.title)
//                .font(.system(
//                    size: 14,
//                    weight: .regular,
//                    design: .default)
//                )
                .font(.custom("Nunito", size: 12)) // 自定义字体
                .padding(4)

            Text("Your time is limited, so don’t waste it living someone else’s life. Don’t be trapped by dogma—which is living with the results of other people’s thinking. Don’t let the noise of others’ opinions drown out your own inner voice. And most important, have the courage to follow your heart and intuition.")
                .font(.body)

                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .lineLimit(10)
//                .lineLimit(nil)// nil 支持多行，默认为nil
                .truncationMode(.tail)
                .lineSpacing(8.0)
                .padding(16)
//                .rotationEffect(.degrees(4))//默认，旋转动作会以文字视图为中心来旋转
//                .rotationEffect(.degrees(4), anchor: .topLeading)
//                .rotation3DEffect(
//                    .degrees(35),
//                    axis: (x: 1, y: 0, z: 0)
//                )
                .shadow(color: .gray, radius: 2, x: 4, y: 4) // 颜色，阴影模糊等级，0不模糊，越大越模糊，x，y的偏移
            // markdown 格式
        }
        .padding()
    }
}

struct SwiftUITextView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUITextView()
    }
}
