//
//  SwiftUIShapeView.swift
//  SwiftUIKit
//
//  Created by sawalon.chen on 2023/6/3.
//

import SwiftUI

struct SwiftUIShapeView: View {
    @State private var percent: Double = 0.85
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            Button {} label: {
                Text("Test")
                    .font(.system(.title, design: .rounded))
                    .bold()
                    .foregroundColor(.white)
                    .frame(width: 250, height: 50)
                    .background(Demo().fill(.red))
            }
            Spacer()
            IndicatorView(percent: $percent)
            Spacer()
            PieIndicatorView()
            Spacer()
        }
    }
}

struct Demo: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: .zero)
        path.addQuadCurve(
            to: .init(x: rect.size.width, y: 0),
            control: .init(x: rect.size.width/2, y: -(rect.size.width * 0.1))
        )
        path.addRect(.init(x: 0, y: 0, width: rect.size.width, height: rect.size.height))
        return path
    }
}

struct IndicatorView: View {
    @Binding var percent: Double

    private let purpleGradient = LinearGradient(
        gradient: Gradient(
            colors: [Color(red: 207/255, green: 150/255, blue: 207/255), Color(red: 107/255, green: 116/255, blue: 179/255)]),
        startPoint: .trailing,
        endPoint: .leading
    )

    var body: some View {
        ZStack {
            Circle()
                .stroke(Color(.systemGray6), lineWidth: 20)
                .frame(width: 300, height: 300)

            Circle()
                .trim(from: 0, to: percent)
                .stroke(purpleGradient, lineWidth: 20)
                .frame(width: 300, height: 300)
                .overlay {
                    VStack {
                        Text("\(percent.formatted(.percent))")
                            .font(.system(size: 80, weight: .bold, design: .rounded))
                            .foregroundColor(.gray)
                        Text("Complete")
                            .font(.system(.body, design: .rounded))
                            .bold()
                            .foregroundColor(.gray)
                    }
                }
        }
    }
}

struct PieIndicatorView: View {
    var body: some View {
        ZStack {
            Circle()
                .trim(from: 0, to: 0.4)
                .stroke(Color(.systemBlue), lineWidth: 80)

            Circle()
                .trim(from: 0.4, to: 0.6)
                .stroke(Color(.systemTeal), lineWidth: 80)

            Circle()
                .trim(from: 0.6, to: 0.75)
                .stroke(Color(.systemPurple), lineWidth: 80)

            Circle()
                .trim(from: 0.75, to: 1)
                .stroke(Color(.systemYellow), lineWidth: 90)
                .overlay(
                    Text("25%")
                        .font(.system(.title, design: .rounded))
                        .bold()
                        .foregroundColor(.white)
                        .offset(x: 80, y: -100)
                )
        }
        .frame(width: 250, height: 250)
    }
}

struct SwiftUIShapeView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIShapeView()
    }
}
