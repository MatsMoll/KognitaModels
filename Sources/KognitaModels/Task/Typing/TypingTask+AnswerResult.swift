//
//  TypingTask+AnswerResult.swift
//  KognitaModels
//
//  Created by Mats Mollestad on 09/12/2020.
//

import Foundation

extension TypingTask {
    
    public struct AnswerResult: Codable {
        let answer: String
        let score: Double
    }
}
