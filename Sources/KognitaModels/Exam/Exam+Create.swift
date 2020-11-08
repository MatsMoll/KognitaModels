//
//  Exam+Create.swift
//  KognitaModels
//
//  Created by Mats Mollestad on 05/11/2020.
//

import Foundation

extension Exam {
    public enum Create {
        public struct Data: Codable {
            public let subjectID: Subject.ID
            public let type: ExamType
            public let year: Int
            
            public init(subjectID: Subject.ID, type: ExamType, year: Int) {
                self.subjectID = subjectID
                self.type = type
                self.year = year
            }
        }
    }
}
