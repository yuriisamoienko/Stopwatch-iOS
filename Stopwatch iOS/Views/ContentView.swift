//
//  ContentView.swift
//  Stopwatch iOS
//
//  Created by Yurii Samoienko on 24.11.2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject
    private var viewModel: ContentViewModel //TODO protocol
    
    var body: some View {
        VStack {
            Text("Stopwatch")
                .bold()
                .padding()
            
            Text(viewModel.timerText)
                .padding()
            
            Button(viewModel.buttonTitle) {
                viewModel.toggle()
            }
        }
    }
    
    init(viewModel: ContentViewModel) {
        self.viewModel = viewModel
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView(viewModel: ContentViewModel())
    }
    
}
