//
//  ContentView.swift
//  StockApp
//
//  Created by Ted Hyeong on 21/01/2021.
//

import SwiftUI

struct ContentView: View {
    
    
    @ObservedObject private var stockListVM = StockListViewModel()
    
    init() {
        UINavigationBar.appearance().backgroundColor = UIColor.black
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UITableView.appearance().separatorStyle = .none
        UITableView.appearance().backgroundColor = UIColor.black
        UITableViewCell.appearance().backgroundColor = UIColor.black
        
        stockListVM.load()
    }
    
    var body: some View {
        
        let currentdate = getDate()
        let filteredStocks = self.stockListVM.searchTerm.isEmpty ? self.stockListVM.stocks : self.stockListVM.stocks.filter { $0.symbol.starts(with: self.stockListVM.searchTerm) }
        
        NavigationView {
            
            ZStack(alignment: .leading) {
                
                Color.black
                
                Text(currentdate)
                    .font(.custom("Arial", size: 32))
                    .fontWeight(.bold)
                    .foregroundColor(Color.gray)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                    .offset(y: -310)
                
                SearchView(searchTerm: self.$stockListVM.searchTerm)
                    .offset(y: -260)
                
                StockListView(stocks: filteredStocks)
                    .offset(y: 240)
                
                NewsArticleView(newsArticles: self.stockListVM.news, onDragBegin: { (value) in
                    self.stockListVM.dragOffset = value.translation
                }, onDragEnd: { (value) in
                    if value.translation.height < 0 {
                        self.stockListVM.dragOffset = CGSize(width: 0, height: 100)
                    } else {
                        self.stockListVM.dragOffset = CGSize(width: 0, height: 750)
                    }
                })
                .animation(.spring())
                .offset(y: self.stockListVM.dragOffset.height)
                
            }
            .background(Color.black)
            .navigationBarTitle(Text("Stocks"))
            .edgesIgnoringSafeArea(.all)
            
        }
        
        
    }
    
    private func getDate() -> String{
        let time = Date()
        let Formatter = DateFormatter()
        Formatter.dateFormat = "dd.MM.yyyy"
        let stringDate = Formatter.string(from: time)
        return stringDate
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.colorScheme, .dark)
    }
}
