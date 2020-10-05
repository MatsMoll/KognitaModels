//
//  LectureNoteRecapSession+Create.swift
//  KognitaModels
//
//  Created by Mats Mollestad on 05/10/2020.
//

import Foundation

extension LectureNote.RecapSession {
    public enum Create {
        public struct Data: Codable {
            public let sessionID: UUID
            public let numberOfTasks: Int
        }
    }
}
