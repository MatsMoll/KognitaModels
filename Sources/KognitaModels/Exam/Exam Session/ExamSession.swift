//
//  ExamSession.swift
//  KognitaCore
//
//  Created by Mats Mollestad on 06/11/2020.
//

import Foundation

public struct ExamSession: Codable, Identifiable {

    public let id: Int
    public let numberOfTaskGoal: Int
    public let createdAt: Date

    public init(id: ExamSession.ID, numberOfTaskGoal: Int, createdAt: Date) {
        self.id = id
        self.numberOfTaskGoal = numberOfTaskGoal
        self.createdAt = createdAt
    }
}
