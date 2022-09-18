//
//  ViewController.swift
//  CSTV
//
//  Created by Leonardo Coutinho Santos on 17/09/22.
//

import UIKit
import SimpleKeychain
import Networking

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        try? SimpleKeychain().deleteAll()
        
        let networking = NetworkingFactory().make()
        let tokenRepository = TokenRepository(keychainProvider: SimpleKeychain())
        let service = MatchListService(networking: networking)
        let matchListRepository = MatchListRepository(service: service, tokenRepository: tokenRepository)
        
        let useCase = GetMatchesForPageUseCase(repository: matchListRepository)

        Task {
            let useCase = await useCase.execute()
            switch useCase {
            case .success(let list):
                print(list)
            case .failure(let error): break
            }
        }
    }
}
