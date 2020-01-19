//
//  Logger.swift
//  viper-exam
//
//  Created by Mustafa GUNES on 19.01.2020.
//  Copyright © 2020 Mustafa GUNES. All rights reserved.
//

class Logger {
    
    static func log(output: Any) {
        #if DEBUG
        print(output)
        #endif
    }
}
