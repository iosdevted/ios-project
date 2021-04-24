//
//  LegoBlock.swift
//  LegoStyleLoadingAnimation
//
//  Created by Ted Hyeong on 18/01/2021.
//

import SwiftUI

struct LegoBlock: View {
    var color: Color
    
    var body: some View {
        Rectangle().fill(color)
            .frame(width: 70, height: 70, alignment: .center)
            .mask(Image("box"))
            .overlay(Image("box").opacity(color == Color(.clear) ? 0 : 0.5))
    }
}

struct LegoBlock_Previews: PreviewProvider {
    static var previews: some View {
        LegoBlock(color: Color.red)
    }
}
