//
//  RecommendedRecap.swift
//  KognitaModels
//
//  Created by Mats Mollestad on 07/10/2020.
//

import Foundation

public struct RecommendedRecap: Codable {
    public init(subjectName: String, subjectID: Subject.ID, topicName: String, topicID: Int, resultScore: Double, revisitAt: Date) {
        self.subjectName = subjectName
        self.subjectID = subjectID
        self.topicName = topicName
        self.topicID = topicID
        self.resultScore = resultScore
        self.revisitAt = revisitAt
    }

    public let subjectName: String
    public let subjectID: Subject.ID
    public let topicName: String
    public let topicID: Int
    public let resultScore: Double
    public let revisitAt: Date
}
