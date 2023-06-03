//
//  SwiftUIPath.swift
//  SwiftUIKit
//
//  Created by sawalon.chen on 2023/6/3.
//

import SwiftUI

struct SwiftUIPath: View {
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            Path() { path in
                path.move(to: CGPoint(x: 20, y: 20))
                path.addLine(to: CGPoint(x: 300, y: 20))
                path.addLine(to: CGPoint(x: 300, y: 50))
                path.addLine(to: CGPoint(x: 20, y: 50))
                path.closeSubpath()// 自动将线条绘制到原点
            }
//            .fill(.green)
            .stroke(.green, lineWidth: 10)
            
            Path() { path in
                path.move(to: CGPoint(x: 20, y: 20))
                path.addLine(to: CGPoint(x: 300, y: 20))
                path.addLine(to: CGPoint(x: 300, y: 50))
                path.addLine(to: CGPoint(x: 20, y: 50))
            }
            .fill(.green)
            HStack {
                ZStack {
                    Path() { path in
                        path.move(to: CGPoint(x: 20, y: 60))
                        path.addLine(to: CGPoint(x: 40, y: 60))
                        path.addQuadCurve(
                            to: CGPoint(x: 210, y: 60),
                            control: CGPoint(x: 125, y: 0)
                        )
                        path.addLine(to: CGPoint(x: 230, y: 60))
                        path.addLine(to: CGPoint(x: 230, y: 100))
                        path.addLine(to: CGPoint(x: 20, y: 100))
                    }
                    .fill(Color.purple)
                    
                    Path() { path in
                        path.move(to: CGPoint(x: 20, y: 60))
                        path.addLine(to: CGPoint(x: 40, y: 60))
                        path.addQuadCurve(
                            to: CGPoint(x: 210, y: 60),
                            control: CGPoint(x: 125, y: 0)
                        )
                        path.addLine(to: CGPoint(x: 230, y: 60))
                        path.addLine(to: CGPoint(x: 230, y: 100))
                        path.addLine(to: CGPoint(x: 20, y: 100))
                        path.closeSubpath()
                    }
                    .stroke(.pink, lineWidth: 2)
                }
            }
            
            Path { path in
                path.move(to: CGPoint(x: 50, y: 50))
                path.addArc(
                    center: .init(x: 50, y: 50),
                    radius: 20,
                    startAngle: .degrees(0),
                    endAngle: .degrees(90),
                    clockwise: true//iPhone的坐标原点在左上角，与通常的左下角上下颠倒。所以顺时针与通常的是相反的方向
                )
                path.addLine(to: CGPoint(x: 50, y: 120))
            }
            .stroke(.green, lineWidth: 4)
            
            Path { path in
                path.move(to: CGPoint(x: 50, y: 50))
                path.addArc(
                    center: .init(x: 50, y: 50),
                    radius: 20,
                    startAngle: .degrees(0),
                    endAngle: .degrees(90),
                    clockwise: false
                )
            }
            .stroke(.green, lineWidth: 4)
        }
        .padding()
        
        PieChartView()

    }
}

struct PieChartView: View {
    var body: some View {
        ZStack {
            Path { path in
                path.move(to: CGPoint(x: 187, y: 187))
                path.addArc(center: .init(x: 187, y: 187), radius: 150, startAngle: .degrees(0), endAngle: .degrees(190), clockwise: true)
            }
            .fill(.yellow)

            Path { path in
                path.move(to: CGPoint(x: 187, y: 187))
                path.addArc(center: .init(x: 187, y: 187), radius: 150, startAngle: .degrees(190), endAngle: .degrees(110), clockwise: true)
            }
            .fill(.teal)

            Path { path in
                path.move(to: CGPoint(x: 187, y: 187))
                path.addArc(center: .init(x: 187, y: 187), radius: 150, startAngle: .degrees(110), endAngle: .degrees(90), clockwise: true)
            }
            .fill(.blue)

            Path { path in
                path.move(to: CGPoint(x: 187, y: 187))
                path.addArc(center: .init(x: 187, y: 187), radius: 150, startAngle: .degrees(90), endAngle: .degrees(360), clockwise: true)
            }
            .fill(.purple)
            .offset(x: 4, y: 4)
            .overlay(
                Text("25%")
                    .font(.system(.largeTitle, design: .rounded))
                    .bold()
                    .foregroundColor(.white)
                    .offset(x: 50, y: -170)
            )

        }
    }
}

struct SwiftUIPath_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIPath()
    }
}
