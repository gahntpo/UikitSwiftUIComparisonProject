//
//  FixedSizeExampleView.swift
//  UikitSwiftUIComparisonProject
//
//  Created by Karin Prater on 02.10.22.
//

import SwiftUI

struct FixedSizeExampleView: View {
    
    @State private var isOn: Bool = true
    
    var body: some View {
        VStack {
            Toggle("Toggle", isOn: $isOn)
                .fixedSize()
                .padding()
            
            Spacer()
                .fixedSize()
            
            Color.gray
                .fixedSize(horizontal: false, vertical: true)
        }
    }
}

struct FixedSizeExampleView_Previews: PreviewProvider {
    static var previews: some View {
        FixedSizeExampleView()
    }
}
