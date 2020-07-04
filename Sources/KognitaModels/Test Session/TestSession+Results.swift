import Foundation

extension TestSession {

    public struct Results: Codable {

        public struct Task: Codable {

            public let pivotID: Int
            public let question: String
            public let score: Double

            public init(pivotID: Int, question: String, score: Double) {
                self.pivotID = pivotID
                self.question = question
                self.score = score
            }
        }

        public struct Topic: Codable {
            public let id: KognitaModels.Topic.ID
            public let name: String
            public let taskResults: [Task]

            public let score: Double
            public let maximumScore: Double

            public var scoreProsentage: Double {
                guard maximumScore != 0 else { return 0 }
                return score / maximumScore
            }

            public var readableScoreProsentage: Double {
                scoreProsentage * 100
            }

            public init(id: KognitaModels.Topic.ID, name: String, taskResults: [Task]) {
                self.id = id
                self.name = name
                self.taskResults = taskResults

                self.score = taskResults.reduce(0) { $0 + $1.score }
                self.maximumScore = Double(taskResults.count)
            }
        }

        public let testTitle: String
        public let testIsOpen: Bool
        public let executedAt: Date
        public let endedAt: Date
        public let shouldPresentDetails: Bool
        public let topicResults: [Topic]
        public let subjectID: Subject.ID
        public let canPractice: Bool

        public let score: Double
        public let maximumScore: Double

        public var scoreProsentage: Double {
            guard maximumScore != 0 else { return 0 }
            return score / maximumScore
        }

        public init(testTitle: String, endedAt: Date, testIsOpen: Bool, executedAt: Date, shouldPresentDetails: Bool, subjectID: Subject.ID, canPractice: Bool, topicResults: [Topic]) {
            self.testTitle = testTitle
            self.testIsOpen = testIsOpen
            self.executedAt = executedAt
            self.endedAt = endedAt
            self.shouldPresentDetails = shouldPresentDetails
            self.subjectID = subjectID
            self.canPractice = canPractice
            self.topicResults = topicResults
            self.score = topicResults.reduce(0) { $0 + $1.score }
            self.maximumScore = topicResults.reduce(0) { $0 + $1.maximumScore }
        }
    }
}

extension TestSession {
    public struct DetailedTaskResult: Codable {

        public init(taskID: Int, description: String?, question: String, isMultipleSelect: Bool, testSessionID: TestSession.ID, choises: [MultipleChoiceTaskChoice], selectedChoises: [MultipleChoiceTaskChoice.ID]) {
            self.taskID = taskID
            self.description = description
            self.question = question
            self.isMultipleSelect = isMultipleSelect
            self.testSessionID = testSessionID
            self.choises = choises
            self.selectedChoises = selectedChoises
        }

        public let taskID: Task.ID
        public let description: String?
        public let question: String
        public let isMultipleSelect: Bool
        public let testSessionID: TestSession.ID
        public let choises: [MultipleChoiceTaskChoice]
        public let selectedChoises: [MultipleChoiceTaskChoice.ID]
    }
}
