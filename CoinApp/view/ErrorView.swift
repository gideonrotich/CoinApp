//
//  ErrorView.swift
//  CoinApp
//
//  Created by Gideon on 11/05/2024.
//

import SwiftUI

struct ErrorView: View {
    @ObservedObject var coinsFetcher : CoinsFetcher
    var body: some View {
        VStack {
        
            Text("😿")
                .font(.system(size: 80))
            
            Text(coinsFetcher.errorMessage ?? "")
            
            Button {
                coinsFetcher.fetchAllCoins()
            } label: {
                Text("Try again")
            }
            
        }    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(coinsFetcher: CoinsFetcher())
    }
}
