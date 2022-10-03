//
//  SizeSwiftUIView.swift
//  UikitSwiftUIComparisonProject
//
//  Created by Karin Prater on 02.10.22.
//

import SwiftUI

struct SizeSwiftUIView: View {
    var body: some View {
        HStack(spacing: 10) {
            Color.teal
            Color.pink
        }
        .padding(.horizontal, 16)
        .frame(height: 250)
        .frame(maxHeight: .infinity, alignment: .top)
    }
}


struct SizeRatioSwiftUIView: View {
    let ratio: CGFloat = 0.7
    var body: some View {
        GeometryReader { proxy in
            HStack(spacing: 10) {
                Color.teal
                    .frame(width: (proxy.size.width - 10) * ratio)
                Color.pink
                    .frame(width: (proxy.size.width - 10)  * (1 - ratio))
            }
        }
        .padding(.horizontal, 16)
        .frame(height: 250)
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

struct SizeSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SizeSwiftUIView()
        SizeRatioSwiftUIView()
            .previewDisplayName("mulitple")
    }
}
