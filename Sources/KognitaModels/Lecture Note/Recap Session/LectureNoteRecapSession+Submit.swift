//
//  LectureNoteRecapSession+Submit.swift
//  KognitaModels
//
//  Created by Mats Mollestad on 05/10/2020.
//

import Foundation

extension LectureNote.RecapSession {
    
    public struct Submit: Codable {
        public init(timeUsed: TimeInterval?, knowledge: Double, answer: String) {
            self.timeUsed = timeUsed
            self.knowledge = knowledge
            self.answer = answer
        }

        public let timeUsed: TimeInterval?
        public let knowledge: Double
        public let answer: String
    }
}
