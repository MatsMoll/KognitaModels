//
//  RecommendedRecap.swift
//  KognitaModels
//
//  Created by Mats Mollestad on 07/10/2020.
//

import Foundation

public struct RecommendedRecap: Codable {
    public init(subjectName: String, topicName: String, topicID: Int, resultScore: Double) {
        self.subjectName = subjectName
        self.topicName = topicName
        self.topicID = topicID
        self.resultScore = resultScore
    }

    public let subjectName: String
    public let topicName: String
    public let topicID: Int
    public let resultScore: Double
}
