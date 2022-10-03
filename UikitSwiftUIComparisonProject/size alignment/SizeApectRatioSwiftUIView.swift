//
//  SizeApectRatioSwiftUIView.swift
//  UikitSwiftUIComparisonProject
//
//  Created by Karin Prater on 02.10.22.
//

import SwiftUI

@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
struct FixedAspectRatioStack: Layout {
    
    let aspectRatio: CGFloat
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let width = proposal.width ?? 0
        
        return CGSize(width: width, height: width / aspectRatio)
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        
        guard !subviews.isEmpty else { return }
        
        let subviewHeight = bounds.width / aspectRatio
        let subviewWidth = bounds.width
        
        let placementProposal = ProposedViewSize(width: subviewWidth, height: subviewHeight)
        var x = bounds.midX
        
        for index in subviews.indices {
            subviews[index].place(at: CGPoint(x: x, y: bounds.midY),
                                  anchor: .center,
                                  proposal: placementProposal)
            x += subviewWidth
        }
    }
}

struct SizeApectRatioSwiftUIView: View {
    var body: some View {
        HStack(spacing: 0) {
            FixedAspectRatioStack(aspectRatio: 0.7) {
                Image("candies")
                    .resizable()
                    .scaledToFill()
            }
            .clipped()
            
            FixedAspectRatioStack(aspectRatio: 0.7) {
                Image("desert")
                    .resizable()
                    .scaledToFill()
            }
            .clipped()
            
        }
    }
}

struct SizeApectRatioSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SizeApectRatioSwiftUIView()
    }
}
