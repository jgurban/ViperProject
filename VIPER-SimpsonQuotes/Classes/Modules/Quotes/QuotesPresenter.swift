//
//  QuotesPresenter.swift
//  VIPER-SimpsonQuotes
//
//  Created by Zafar on 1/2/20.
//  Copyright © 2020 Zafar. All rights reserved.
//

import Foundation

// Estos son los protocolos que tiene que cumplir el presenter cuando se lo pide View.

class QuotesPresenter: ViewToPresenterQuotesProtocol {
    
    // MARK: Properties
    weak var view: PresenterToViewQuotesProtocol?
    var interactor: PresenterToInteractorQuotesProtocol?
    var router: PresenterToRouterQuotesProtocol?
    
    var quotesStrings: [String]?
    
    // MARK: Inputs from view
    func viewDidLoad() {
        print("Presenter is being notified that the View was loaded.")
        view?.showHUD()
        interactor?.loadQuotes()
    }
    
    func refresh() {
        print("Presenter is being notified that the View was refreshed.")
        interactor?.loadQuotes()
    }
    
    func numberOfRowsInSection() -> Int {
        guard let quotesStrings = self.quotesStrings else {
            return 0
        }
        
        return quotesStrings.count
    }
    
    func textLabelText(indexPath: IndexPath) -> String? {
        guard let quotesStrings = self.quotesStrings else {
            return nil
        }
        
        return quotesStrings[indexPath.row]
    }

    
    func didSelectRowAt(index: Int) {
        interactor?.retrieveQuote(at: index)
    }
    
    func deselectRowAt(index: Int) {
        view?.deselectRowAt(row: index)
    }
    
}


// Estos son los protocolos que tiene que cumplir presenter cuando se los solcita el Interactor
// MARK: - Outputs to view
extension QuotesPresenter: InteractorToPresenterQuotesProtocol {
    
    func fetchQuotesSuccess(quotes: [Quote]) {
        print("Presenter receives the result from Interactor after it's done its job.")
        self.quotesStrings = quotes.compactMap { $0.quote }
        view?.hideHUD()
        view?.onFetchQuotesSuccess()
    }
    
    func fetchQuotesFailure(errorCode: Int) {
        print("Presenter receives the result from Interactor after it's done its job.")
        view?.hideHUD()
        view?.onFetchQuotesFailure(error: "Couldn't fetch quotes: \(errorCode)")
    }
    
    func getQuoteSuccess(_ quote: Quote) {
        router?.pushToQuoteDetail(on: view!, with: quote)
    }
    
    func getQuoteFailure() {
        view?.hideHUD()
        print("Couldn't retrieve quote by index")
    }
    
    
}
