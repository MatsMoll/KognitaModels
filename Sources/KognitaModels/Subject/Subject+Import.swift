//
//  Subject+Import.swift
//  KognitaCore
//
//  Created by Mats Mollestad on 08/11/2020.
//

import Foundation

extension MultipleChoiceTask {
    public struct Import: Codable, Task {

        public var id: Int { 0 }
        public var subtopicID: Subtopic.ID { 0 }
        public let description: String?
        public let question: String
        public var creatorID: User.ID? { nil }
        public let exam: Exam.Compact?
        public let isTestable: Bool
        public var createdAt: Date? { nil }
        public var updatedAt: Date? { nil }
        public var deletedAt: Date? { nil }
        public var editedTaskID: Int? { nil }
        public let isMultipleSelect: Bool
        public let choices: [MultipleChoiceTaskChoice.Create.Data]

        public let solutions: [TaskSolution.Create.Data]

        public init(description: String?, question: String, exam: Exam.Compact?, isTestable: Bool, isMultipleSelect: Bool, choices: [MultipleChoiceTaskChoice.Create.Data], solutions: [TaskSolution.Create.Data]) {
            self.description = description
            self.question = question
            self.exam = exam
            self.isTestable = isTestable
            self.isMultipleSelect = isMultipleSelect
            self.choices = choices
            self.solutions = solutions
        }

        public init(task: MultipleChoiceTask.Details) {
            self.description = task.description
            self.question = task.question
            self.exam = task.exam
            self.isTestable = task.isTestable
            self.choices = task.choices.map { MultipleChoiceTaskChoice.Create.Data(choice: $0.choice, isCorrect: $0.isCorrect) }
            self.solutions = task.solutions.map { TaskSolution.Create.Data(solution: $0.solution, presentUser: true, taskID: 0) }
            self.isMultipleSelect = task.isMultipleSelect
        }
    }
}

extension TypingTask {
    public struct Import: Codable {

        public var id: Int { 0 }
        public var subtopicID: Subtopic.ID { 0 }
        public let description: String?
        public let question: String
        public var creatorID: User.ID? { nil }
        public let exam: Exam.Compact?
        public var isTestable: Bool { false }
        public var createdAt: Date? { nil }
        public var updatedAt: Date? { nil }
        public var deletedAt: Date? { nil }
        public var editedTaskID: Int? { nil }

        public let solutions: [TaskSolution.Create.Data]

        public init(description: String?, question: String, exam: Exam.Compact?, solutions: [TaskSolution.Create.Data]) {
            self.description = description
            self.question = question
            self.exam = exam
            self.solutions = solutions
        }

        public init(task: TypingTask.Details) {
            self.description = task.description
            self.question = task.question
            self.exam = task.exam
            self.solutions = task.solutions.map { TaskSolution.Create.Data(solution: $0.solution, presentUser: true, taskID: 0) }
        }
    }
}

extension Subtopic {
    public struct Import: Codable {
        public init(subtopic: Subtopic.Create.Data, multipleChoiceTasks: [MultipleChoiceTask.Import], typingTasks: [TypingTask.Import]) {
            self.subtopic = subtopic
            self.multipleChoiceTasks = multipleChoiceTasks
            self.typingTasks = typingTasks
        }

        public let subtopic: Subtopic.Create.Data
        public let multipleChoiceTasks: [MultipleChoiceTask.Import]
        public let typingTasks: [TypingTask.Import]
    }

    public struct Export: Codable {
        public init(subtopic: Subtopic, multipleChoiceTasks: [MultipleChoiceTask.Details], typingTasks: [TypingTask.Details]) {
            self.subtopic = subtopic
            self.multipleChoiceTasks = multipleChoiceTasks
            self.typingTasks = typingTasks
        }

        public let subtopic: Subtopic
        public let multipleChoiceTasks: [MultipleChoiceTask.Details]
        public let typingTasks: [TypingTask.Details]

        public var importContent: Subtopic.Import {
            Subtopic.Import(
                subtopic: Subtopic.Create.Data(name: subtopic.name, topicId: 0),
                multipleChoiceTasks: multipleChoiceTasks.map { .init(task: $0) },
                typingTasks: typingTasks.map { .init(task: $0) }
            )
        }
    }
}

extension Topic {
    public struct Import: Codable {
        public init(topic: Topic.Create.Data, subtopics: [Subtopic.Import]) {
            self.topic = topic
            self.subtopics = subtopics
        }

        public let topic: Topic.Create.Data
        public let subtopics: [Subtopic.Import]

        public var exams: Set<Exam.Compact> {
            subtopics.reduce(into: Set<Exam.Compact>()) { exams, subtopic in
                exams.formUnion(subtopic.multipleChoiceTasks.compactMap(\.exam) + subtopic.typingTasks.compactMap(\.exam))
            }
        }
    }

    public struct Export: Codable {
        public init(topic: Topic, subtopics: [Subtopic.Export]) {
            self.topic = topic
            self.subtopics = subtopics
        }

        public let topic: Topic
        public let subtopics: [Subtopic.Export]

        public var importContent: Topic.Import {
            Topic.Import(
                topic: Topic.Create.Data(
                    subjectID: 0,
                    name: topic.name,
                    chapter: topic.chapter
                ),
                subtopics: subtopics.map { $0.importContent }
            )
        }
    }
}

extension Subject {
    public struct Import: Codable {
        public init(subject: Subject.Create.Data, topics: [Topic.Import]) {
            self.subject = subject
            self.topics = topics
        }

        public let subject: Subject.Create.Data
        public let topics: [Topic.Import]

        public var exams: Set<Exam.Compact> {
            topics.reduce(into: Set<Exam.Compact>()) { $0.formUnion($1.exams) }
        }
    }

    public struct Export: Codable {
        public init(subject: Subject, topics: [Topic.Export]) {
            self.subject = subject
            self.topics = topics
        }

        public let subject: Subject
        public let topics: [Topic.Export]

        public var importContent: Subject.Import {
            Subject.Import(
                subject: Subject.Create.Data(
                    name: subject.name,
                    description: subject.description,
                    category: subject.category
                ),
                topics: topics.map { $0.importContent }
            )
        }
    }
}
