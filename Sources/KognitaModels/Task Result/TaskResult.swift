//
//  TaskResult.swift
//  Async
//
//  Created by Mats Mollestad on 01/06/2020.
//

import Foundation

/// Representatino of a result on a `Task`
public struct TaskResult: Codable, Identifiable {

    /// The id of the result
    public var id: Int

    /// When it was created
    public var createdAt: Date

    /// The date this task should be revisited
    public var revisitDate: Date?

    /// The user how executed the task
    /// Is optional since the user may delete the user, but this info is still relevant for the service
    public var userID: User.ID?

    /// The id of the `Task`
    public var taskID: Task.ID

    /// The score achived
    public var resultScore: Double

    /// The time used on the task if recored
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

/// A recummended structure for a task result
public protocol TaskResultable {
    /// The topic ID
    var topicID: Topic.ID { get }

    /// Teh topic name
    var topicName: String { get }

    /// The index of the task in a session
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

extension Sessions.TaskResult: TaskResultable {
    public var revisitTime: Int { 0 }
    public var resultDescription: String { "" }
}
