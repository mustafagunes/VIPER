//
//  UserInteractor.swift
//  viper-exam
//
//  Created Mustafa GUNES on 22.01.2020.
//  Copyright © 2020 Mustafa GUNES. All rights reserved.
//
//

import UIKit

class UserInteractor: UserInteractorInputProtocol {
    
    // MARK: - Definitions
    weak var presenter: UserInteractorOutputProtocol?
    
    // MARK: - Method
    func getUsers() {
        let request = GetUserRequest()
        request.fetchData(success: { (users) in
            self.presenter?.resultUsers(users: users.array)
        }) { (error) in
            switch error {
            case .serviceError( _, let message):
                self.presenter?.errorService(message: message)
            default:
                break
            }
        }
    }
}
