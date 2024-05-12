//
//  ContentView.swift
//  CoinApp
//
//  Created by Gideon on 11/05/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var coinsFetcher = CoinsFetcher()
    var body: some View {
        if coinsFetcher.isLoading{
            LoadingView()
        }else if coinsFetcher.errorMessage != nil{
            ErrorView(coinsFetcher: coinsFetcher)
        }else{
            CoinsListView(coins: coinsFetcher.coins)
        }
    }
}
