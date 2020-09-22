//
//  Note.swift
//  KognitaModels
//
//  Created by Mats Mollestad on 17/09/2020.
//

import Foundation

public struct LectureNote: Codable, Identifiable {
    public let id: Int
    public let question: String
    public let solution: String
    public let subtopicID: Subtopic.ID
    public let userID: User.ID

    public init(id: Int, question: String, solution: String, subtopicID: Subtopic.ID, userID: User.ID) {
        self.id = id
        self.question = question
        self.solution = solution
        self.subtopicID = subtopicID
        self.userID = userID
    }
}

extension LectureNote {

    public enum Create {

        public struct Data: Codable {

            public let noteSession: UUID

            public let subtopicID: Subtopic.ID

            public let description: String?

            public let question: String

            public let solution: String?

            public init(noteSession: UUID, subtopicID: Subtopic.ID, description: String?, question: String, solution: String?) {
                self.noteSession = noteSession
                self.subtopicID = subtopicID
                self.description = description
                self.question = question
                self.solution = solution
            }
        }
    }
}
