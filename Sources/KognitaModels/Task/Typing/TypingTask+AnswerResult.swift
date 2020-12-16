//
//  TypingTask+AnswerResult.swift
//  KognitaModels
//
//  Created by Mats Mollestad on 09/12/2020.
//

import Foundation

extension TypingTask {
    
    /// A answer with the assingend score
    public struct AnswerResult: Codable {
        /// The submitted answer
        let answer: String
        
        /// The submitted score
        let score: Double
        
        /// The id of the task
        let taskID: Task.ID
        
        /// If the score was set manually by the user or if it was an estimate
        let isSetManually: Bool
    }
}
