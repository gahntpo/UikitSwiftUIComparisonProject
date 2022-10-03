//
//  MeasureSizeSwiftUIView.swift
//  UikitSwiftUIComparisonProject
//
//  Created by Karin Prater on 02.10.22.
//

import SwiftUI

struct BoundsPreferenceKey: PreferenceKey {
    static var defaultValue: CGRect = .zero
    
    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
        value = nextValue()
    }
}

struct BoundsMeasurement: ViewModifier {
    
    @Binding var bounds: CGRect
    let nameSpace: String
    
    func body(content: Content) -> some View {
        content
            .background {
                GeometryReader { geometry in
                    Color.clear
                        .preference(key: BoundsPreferenceKey.self,
                                    value: geometry.frame(in: .named(nameSpace)))
                }
                .onPreferenceChange(BoundsPreferenceKey.self) { bounds in
                    self.bounds = bounds
                }
            }
    }
}

extension View {
    func measureBounds(bounds: Binding<CGRect>, nameSpace: String) -> some View {
        self.modifier(BoundsMeasurement(bounds: bounds, nameSpace: nameSpace))
    }
}


struct MeasureSizeSwiftUIView: View {
    @State private var size: CGRect = .zero
    @State private var titleFrame: CGRect = .zero
    
    var body: some View {
        VStack {
            ZStack(alignment: .topLeading) {
                Color.teal
                Text("Hello, World!")
                    .font(.title)
                    .measureBounds(bounds: $titleFrame, nameSpace: "space")
                    
            }
            .coordinateSpace(name: "space")
            .measureBounds(bounds: $size, nameSpace: "space")
            .frame(height: size.width)
            
            Text("size \(size.width) - \(size.height)")
            Text("origin \(titleFrame.minX) - \(titleFrame.minY)")
           
        }
    }
}

struct MeasureSizeSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        MeasureSizeSwiftUIView()
    }
}
