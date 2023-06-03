//
//  SwiftUIButtonView.swift
//  SwiftUIKit
//
//  Created by sawalon.chen on 2023/5/21.
//

import SwiftUI

struct SwiftUIButtonView: View {
    var body: some View {
        VStack {
            BassicButtonUsageView()
            //将样式应用到多个按钮
                .tint(.purple)
                .buttonStyle(.bordered)
                .buttonBorderShape(.roundedRectangle)
                .controlSize(.large)
            
            Text("按钮样式")
                .font(.title)
            
            Button(role: .destructive, action: {}) {
                Text("Button role")
            }
            //指定按钮的颜色，紫色
//            .tint(.purple)
            //按钮呈现为紫色背景并以白色显示文字
            .buttonStyle(.bordered)
            //设置按钮的边框形状
            .buttonBorderShape(.capsule)
            //默认大小为 .regular
            .controlSize(.large)
        }
        .padding(.horizontal)
    }
}

struct BassicButtonUsageView: View {
    var body: some View {
        VStack {
            Text("基础Button使用")
                .font(.title)
            Button(action: {
                // 所需运行的内容
            }, label: {
                // 按钮外观设定
                Text("Hello World")
                    .font(.title)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.green)
                    .cornerRadius(40)
                    .padding(10)
                    .background(Color.yellow)
                    .cornerRadius(40)
                    .overlay(content: {
                        RoundedRectangle(cornerRadius: 40)
                            .stroke(.purple, lineWidth: 5)
                    })
                //                .border(Color.purple, width: 5)
            })
            // MARK: button带图片
            Button(action: {
                
            }, label: {
                HStack {
                    Image(systemName: "trash")
                        .font(.title)
//                        .padding()
//                        .background(.red)
//                        .clipShape(Circle())
//                        .font(.largeTitle)
//                        .foregroundColor(.white)
                    Text("Delete")
                        .fontWeight(.semibold)
                        .font(.title)
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding()
                .foregroundColor(.white)
                .background(Color.red)
                .cornerRadius(40)
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
            })
            // MARK: 标签的用法
            Button(action: {
                
            }, label: {
                Label(title: {
                    Text("Delete")
                        .fontWeight(.semibold)
                        .font(.title)
                }, icon: {
                    Image(systemName: "trash")
                        .font(.title)
                })
                .padding()
                .foregroundColor(.white)
                .background(.red)
                .background(LinearGradient(
                    gradient: Gradient(colors: [.red, .blue]),
                    startPoint: .leading,
                    endPoint: .trailing))
                .cornerRadius(40)
                .shadow(radius: 5.0)
            })
            .buttonStyle(GradientBackgroundStyle())
            
            Button(action: {
                
            }, label: {
                Label(title: {
                    Text("Delete")
                        .fontWeight(.semibold)
                        .font(.title)
                }, icon: {
                    Image(systemName: "trash")
                        .font(.title)
                })
            })
            .buttonStyle(GradientBackgroundStyle())
        }
    }
}

//MARK: 为按钮建立一个可以重复使用的样式
struct GradientBackgroundStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .foregroundColor(.white)
            .background(LinearGradient(
                gradient: Gradient(colors: [.pink, .blue]),
                startPoint: .leading,
                endPoint: .trailing)
            )
            .cornerRadius(40)
            .padding(.horizontal, 20)
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
    
    
}

struct SwiftUIButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIButtonView()
    }
}
