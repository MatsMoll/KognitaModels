//
//  LectureNoteRecapSession+ExecuteTask.swift
//  KognitaModels
//
//  Created by Mats Mollestad on 05/10/2020.
//

import Foundation

extension LectureNote.RecapSession {

    public struct ExecuteTask: Codable {

        public init(task: GenericTask, numberOfTasksGoal: Int, progress: Double, submitedAnswer: TypingTask.Answer?, registeredScore: Double?, nextTaskIndex: Int?, prevTaskIndex: Int?) {
            self.task = task
            self.numberOfTasksGoal = numberOfTasksGoal
            self.progress = progress
            self.submitedAnswer = submitedAnswer
            self.registeredScore = registeredScore
            self.nextTaskIndex = nextTaskIndex
            self.prevTaskIndex = prevTaskIndex
        }


        public let task: GenericTask
        public let numberOfTasksGoal: Int
        public let progress: Double
        public let submitedAnswer: TypingTask.Answer?
        public let registeredScore: Double?
        public let nextTaskIndex: Int?
        public let prevTaskIndex: Int?
    }
}
