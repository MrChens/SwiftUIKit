//
//  SwiftUIStateView.swift
//  SwiftUIKit
//
//  Created by sawalon.chen on 2023/6/3.
//

import SwiftUI

struct SwiftUIStateView: View {
    @State
    private var isPlaying = false
    @State
    private var counts:[Int] = [0,0,0]
    
    var body: some View {
        VStack {
            Button {
                isPlaying.toggle()
            } label: {
                Image(systemName: isPlaying ? "stop.circle.fill" : "play.circle.fill")
                    .font(.system(size: 150))
                    .foregroundColor(isPlaying ? .red : .green)
            }
            
            Text("\(counts.reduce(0, +))")
                .font(.system(size: 100, weight: .bold, design: .rounded))
                .padding()
            
            HStack {
                CounterButton(counter: $counts[0], color: .blue)
                CounterButton(counter: $counts[1], color: .green)
                CounterButton(counter: $counts[2], color: .red)
            }
            .padding()
        }
        .padding()
    }
}

struct CounterButton: View {
    @Binding var counter: Int
    var color: Color
    
    var body: some View {
        Button {
            counter = counter + 1
        } label: {
            Circle()
                .foregroundColor(color)
                .padding()
                .overlay {
                    Text("\(counter)")
                        .font(.system(size: 50, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                }
        }
    }
}

struct SwiftUIStateView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIStateView()
    }
}
