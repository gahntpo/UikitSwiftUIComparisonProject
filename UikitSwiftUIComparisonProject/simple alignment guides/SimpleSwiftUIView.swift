//
//  SimpleSwiftUIView.swift
//  UikitSwiftUIComparisonProject
//
//  Created by Karin Prater on 02.10.22.
//

import SwiftUI

struct SimpleSwiftUIView: View {
    var body: some View {
        VStack {
            Text("Center Aligned")
                .frame(maxHeight: .infinity, alignment: .top)
           // Spacer()
        }
    }
}

struct SimpleSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SimpleSwiftUIView()
    }
}
