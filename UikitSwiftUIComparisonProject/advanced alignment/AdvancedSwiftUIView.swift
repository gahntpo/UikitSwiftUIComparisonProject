//
//  AdvancedSwiftUIView.swift
//  UikitSwiftUIComparisonProject
//
//  Created by Karin Prater on 02.10.22.
//

import SwiftUI

struct AdvancedSwiftUIView: View {
    
    @State private var bounds = CGRect(origin: .zero, size: CGSize(width: 100, height: 100))
    
    var body: some View {
        VStack(spacing: 20) {
            ZStack(alignment: .bottom) {
                Image("candies")
                    .resizable()
                    .scaledToFill()
                    .measureBounds(bounds: $bounds, nameSpace: "space")
                    .frame(height: bounds.width * 0.7)
                
                Image("desert")
                    .resizable()
                    .scaledToFit()
                    .mask(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 10))
                    .shadow(radius: 15)
                    .frame(width: bounds.width * 0.6)
                
                    .alignmentGuide(.bottom) { viewDimensions in
                       viewDimensions[VerticalAlignment.center]
                    }
            }
            
            Text("Hello, World!")
        }
    }
}

struct AdvancedSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        AdvancedSwiftUIView()
    }
}
