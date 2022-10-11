//
//  ContentView.swift
//  Hysteria
//
//  Created by 강수진 on 2022/10/11.
//

import SwiftUI

struct ContentView: View {
    
    //MARK: - Constants
    enum Constants {
        static let timerInterval: Double = 1
        static let horizontalPadding: CGFloat = 500
        static let fontName: String = "NotoSerifKR-Regular"
        static let fontSize: CGFloat = 14
    }
   
    //MARK: - Properties
    @State private var selectedSentences: [SelectedSentence]
    private let datasource = Datasource()
    private let timer = Timer.publish(every: Constants.timerInterval, on: .main, in: .common).autoconnect()
    
    //MARK: - init
    init() {
        self.selectedSentences = datasource.selectRandomLanguage().map(SelectedSentence.init)
    }
    
    //MARK: - body
    var body: some View {
        let halfIndex = selectedSentences.count / 2
        let leftIndex = halfIndex
        let rightIndex =  selectedSentences.count.isMultiple(of: 2) ? halfIndex : halfIndex + 1
        
        HStack(alignment: .top) {
            HalfView(position: .left,
                     sentences: Array(selectedSentences.prefix(leftIndex)))
            HalfView(position: .left,
                     sentences: Array(selectedSentences.suffix(rightIndex)))
        }
        .onReceive(timer) { input in
            selectedSentences = datasource.selectRandomLanguage().map(SelectedSentence.init)
        }
        .font(.custom(Constants.fontName, size: Constants.fontSize))
        .padding(.horizontal, Constants.horizontalPadding)
        .frame(maxHeight: .infinity)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
