//
//  TaskResult.swift
//  Async
//
//  Created by Mats Mollestad on 01/06/2020.
//

import Foundation

public struct TaskResult: Codable, Identifiable {

    public var id: Int

    public var createdAt: Date

    /// The date this task should be revisited
    public var revisitDate: Date?

    /// The user how executed the task
    /// Is optional since the user may delete the user, but this info is still relevant for the service
    public var userID: User.ID?

    public var taskID: Task.ID

    public var resultScore: Double

    public var timeUsed: TimeInterval?

    /// Either a `TestSession`.`ID` or `PracticeSession`.`ID`
    public var sessionID: Int?

    public init(id: Int, createdAt: Date, revisitDate: Date? = nil, userID: User.ID? = nil, taskID: Int, resultScore: Double, timeUsed: TimeInterval? = nil, sessionID: Int? = nil) {
        self.id = id
        self.createdAt = createdAt
        self.revisitDate = revisitDate
        self.userID = userID
        self.taskID = taskID
        self.resultScore = resultScore
        self.timeUsed = timeUsed
        self.sessionID = sessionID
    }
}


public protocol TaskResultable {
    var topicID: Topic.ID { get }
    var topicName: String { get }
    var taskIndex: Int { get }
    var question: String { get }
    var revisitTime: Int { get }
    var resultDescription: String { get }
    var resultScore: Double { get }
    var timeUsed: TimeInterval { get }
    var date: Date? { get }
    var revisitDate: Date? { get }
    var isSetManually: Bool { get }
}


extension PracticeSession.TaskResult: TaskResultable {
    public var revisitTime: Int { 0 }
    public var resultDescription: String { "" }
}
