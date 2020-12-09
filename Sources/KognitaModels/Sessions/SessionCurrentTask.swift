//
//  GenericSessionCurrentTask.swift
//  KognitaCore
//
//  Created by Mats Mollestad on 07/11/2020.
//

import Foundation

/// Describes a more generic task
public struct TaskType: Codable {
    
    /// The generic task information
    public let task: GenericTask
    
    /// If it is possible to select multiple choices
    /// is nil if it is not a mutliple chocie task
    public let isMultipleSelect: Bool?
    
    /// The id of the task
    public var taskID: Task.ID { task.id }

    public init(task: GenericTask, isMultipleSelect: Bool?) {
        self.task = task
        self.isMultipleSelect = isMultipleSelect
    }
}

extension Sessions {
    /// The current task in a session
    public struct CurrentTask: Codable {
        
        /// The id of the session
        public let sessionID: Sessions.ID
        
        /// The task represented with the current task
        public let task: TaskType
        
        /// The index of the current task
        public let index: Int
        
        /// The user assosiated with the session
        public let user: User

        public init(sessionID: Sessions.ID, task: TaskType, index: Int, user: User) {
            self.sessionID = sessionID
            self.task = task
            self.index = index
            self.user = user
        }
    }
}
