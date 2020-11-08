//
//  Exam.swift
//  KognitaModels
//
//  Created by Mats Mollestad on 05/11/2020.
//

import Foundation

public enum ExamType: String, Codable {
    case original
    case continuation
}

public struct Exam: Identifiable, Codable, Hashable {
    
    public let id: Int
    
    public let subjectID: Subject.ID
    
    public let type: ExamType
    
    public let year: Int
    
    public var description: String { "\(year) \(type == .original ? "orginal" : "konte")" }
    
    public let createdAt: Date
    
    public let updatedAt: Date
    
    public var compactData: Exam.Compact { .init(exam: self) }
    
    public init(id: Int, subjectID: Subject.ID, type: ExamType, year: Int, createdAt: Date, updatedAt: Date) {
        self.id = id
        self.subjectID = subjectID
        self.type = type
        self.year = year
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}

extension Exam {
    public struct Compact: Codable, Hashable {
        
        
        public let subjectID: Subject.ID
        
        public let type: ExamType
        
        public let year: Int
        
        public var description: String { "\(year) \(type == .original ? "orginal" : "konte")" }
        
        public init(exam: Exam) {
            self.subjectID = exam.subjectID
            self.type = exam.type
            self.year = exam.year
        }
        
        public init(subjectID: Subject.ID, type: ExamType, year: Int) {
            self.subjectID = subjectID
            self.type = type
            self.year = year
        }
    }
}

extension Exam {
    public struct Completion: Codable {
        
        public let examID: Exam.ID
        
        public let score: Double
        
        public let maxScore: Double
        
        public init(examID: Exam.ID, score: Double, maxScore: Double) {
            self.examID = examID
            self.score = score
            self.maxScore = maxScore
        }
    }
}

extension Exam {
    public struct WithCompletion: Codable {
        
        public let id: Int
        
        public let subjectID: Subject.ID
        
        public let type: ExamType
        
        public let year: Int
        
        public var description: String { "År \(year) \(type == .original ? "orginal" : "konte")" }
        
        public let createdAt: Date
        
        public let updatedAt: Date
        
        public let numberOfTasks: Int
        
        public let completion: Exam.Completion
        
        public var score: Double {
            guard completion.maxScore != 0 else { return 0 }
            return completion.score / completion.maxScore
        }
        
        public init(exam: Exam.WithNumberOfTasks, completion: Exam.Completion?) {
            self.id = exam.id
            self.subjectID = exam.subjectID
            self.type = exam.type
            self.year = exam.year
            self.createdAt = exam.createdAt
            self.updatedAt = exam.updatedAt
            self.numberOfTasks = exam.numberOfTasks
            self.completion = completion ?? .init(examID: exam.id, score: 0, maxScore: Double(exam.numberOfTasks))
        }
    }
}

extension Exam {
    public struct WithNumberOfTasks: Codable {
        
        public let id: Int
        
        public let subjectID: Subject.ID
        
        public let type: ExamType
        
        public let year: Int
        
        public var description: String { "År \(year) \(type == .original ? "orginal" : "konte")" }
        
        public let createdAt: Date
        
        public let updatedAt: Date
        
        public let numberOfTasks: Int
        
        public init(id: Int, subjectID: Subject.ID, type: ExamType, year: Int, createdAt: Date, updatedAt: Date, numberOfTasks: Int) {
            self.id = id
            self.subjectID = subjectID
            self.type = type
            self.year = year
            self.createdAt = createdAt
            self.updatedAt = updatedAt
            self.numberOfTasks = numberOfTasks
        }
    }
}
