//
//  LoadingView.swift
//  CoinApp
//
//  Created by Gideon on 11/05/2024.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack(spacing: 20){
            Text("😸")
                .font(.system(size: 80))
            ProgressView()
            Text("Getting the coins..")
                .foregroundColor(.gray)
            
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
