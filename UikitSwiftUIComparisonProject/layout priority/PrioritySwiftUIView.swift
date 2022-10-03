//
//  PrioritySwiftUIView.swift
//  UikitSwiftUIComparisonProject
//
//  Created by Karin Prater on 02.10.22.
//

import SwiftUI

struct PrioritySwiftUIView: View {
    var body: some View {
        HStack {
            Text("This is the beginning")
                .background(Color.gray)
                .layoutPriority(1)
            
            Text("very long text")
                .background(Color.blue)
                .layoutPriority(1)
            
            Color.gray
        }
        .lineLimit(1)
        .font(.system(size: 20))
    }
}

struct PrioritySwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        PrioritySwiftUIView()
    }
}
