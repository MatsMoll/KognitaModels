import Foundation

extension TestSession {

    public struct Results: Codable {

        /// Describing the result for a given test that was in the test
        public struct Task: Codable {

            /// The id representing the task in the test
            public let pivotID: Int

            /// The question that was answerd
            public let question: String

            /// The achived score for the question
            public let score: Double

            public init(pivotID: Int, question: String, score: Double) {
                self.pivotID = pivotID
                self.question = question
                self.score = score
            }
        }

        /// A topic that was covered in the test
        public struct Topic: Codable {

            /// The id of the `Topic`
            public let id: KognitaModels.Topic.ID

            /// The name of the `Topic`
            public let name: String

            /// The different task results in the `Topic`
            public let taskResults: [Task]

            /// The accumilated score that was achived
            public let score: Double

            /// The maximum possible score to achive
            public let maximumScore: Double

            /// The percentage achived
            public var scoreProsentage: Double {
                guard maximumScore != 0 else { return 0 }
                return score / maximumScore
            }

            /// A percentage between 0...100
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

        /// The title of the test
        public let testTitle: String

        /// If the test is still open or not
        public let testIsOpen: Bool

        /// The time the user executed the test
        public let executedAt: Date

        /// The time the user ended the test
        public let endedAt: Date

        /// If the details should be presented
        public let shouldPresentDetails: Bool

        /// The different results grouped by `Topic`s
        public let topicResults: [Topic]

        /// The subject id of the subject beeing coverd
        public let subjectID: Subject.ID

        /// If the user can practice in the `Subject`
        public let canPractice: Bool

        /// The total score achived
        public let score: Double

        /// The maximum score that can be achived
        public let maximumScore: Double

        /// The score percentage
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

    /// A more detailed task result
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

        /// The task id
        public let taskID: Task.ID

        /// The description of task if it exists
        public let description: String?

        /// The question of the task
        public let question: String

        /// If the task can have multiple correct answers
        public let isMultipleSelect: Bool

        /// The id of the test session the results are assosiated with
        public let testSessionID: TestSession.ID

        /// The choices in the task
        public let choises: [MultipleChoiceTaskChoice]

        /// The users selected choices
        public let selectedChoises: [MultipleChoiceTaskChoice.ID]
    }
}
