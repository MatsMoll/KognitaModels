//
//  LectureNoteTakingSession.swift
//  KognitaModels
//
//  Created by Mats Mollestad on 28/09/2020.
//

import Foundation

extension LectureNote {
    public struct TakingSession: Codable, Identifiable {
        public let id: UUID
        public let userID: User.ID
        public let createdAt: Date

        public init(id: UUID, userID: User.ID, createdAt: Date) {
            self.id = id
            self.userID = userID
            self.createdAt = createdAt
        }
    }
}
