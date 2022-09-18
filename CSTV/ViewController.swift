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
        let service = MatchListService(networking: networking)
        let tokenRepository = TokenRepository(keychainProvider: SimpleKeychain())
        
        let repository = MatchListRepository(
            service: service,
            tokenRepository: tokenRepository
        )
        
        Task {
            let response = await repository.getMatches(for: 1, beginningAt: .now)
            switch response {
            case .success(let list):
                print(list)
            case .failure(let error): break
            }
        }
    }


}

