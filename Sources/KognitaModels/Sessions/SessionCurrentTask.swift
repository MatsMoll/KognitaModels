//
//  GenericSessionCurrentTask.swift
//  KognitaCore
//
//  Created by Mats Mollestad on 07/11/2020.
//

import Foundation

public struct TaskType: Codable {

    public let task: GenericTask
    public let isMultipleSelect: Bool?

    public var taskID: Task.ID { task.id }

    public init(task: GenericTask, isMultipleSelect: Bool?) {
        self.task = task
        self.isMultipleSelect = isMultipleSelect
    }
}

extension Sessions {
    public struct CurrentTask: Codable {

        public let sessionID: Sessions.ID
        public let task: TaskType
        public let index: Int
        public let user: User

        public init(sessionID: Sessions.ID, task: TaskType, index: Int, user: User) {
            self.sessionID = sessionID
            self.task = task
            self.index = index
            self.user = user
        }
    }
}
