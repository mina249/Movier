//
//  SortingCard.swift
//  Movier
//
//  Created by Min Nageh on 18/01/2024.
//

import SwiftUI

struct SortingCard: View {
    var endPoint:EndPoint
    @Binding var selectedSortType : EndPoint
    
    
    var body: some View {
        VStack(spacing: 20){
            Text(endPoint.sortingName)
                .frame(width: cardWidth,height: cardHeight)
                .foregroundColor(Color.white)
                .fontWeight(.bold)
                .background(isSelected ? Color.gray : Color.clear)
                .overlay(
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(isSelected ? LinearGradient(colors: [Color.appPink,.teal,Color.appGreen],startPoint: .topLeading,endPoint: .bottomTrailing) : LinearGradient(colors: [.white],startPoint: .topLeading,endPoint: .bottomTrailing), lineWidth: 5)
                    )
                .cornerRadius(25)
             }
    }
}
extension SortingCard{
    var cardWidth:CGFloat{
        screenWidth * Constants.SORTING_CARD_WIDHT_PERCENT
    }
    var cardHeight:CGFloat{
        screenHeight * Constants.SORTING_CARD_HEIGHT_PERCENT
    }
    var isSelected:Bool{
        selectedSortType ==  endPoint
    }
}

#Preview {
    SortingCard(endPoint: .popular,selectedSortType: .constant(.popular))
}
