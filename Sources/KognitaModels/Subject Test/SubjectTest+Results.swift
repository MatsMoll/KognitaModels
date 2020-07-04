import Foundation


extension SubjectTest {

    public struct Results: Codable {

        public let title: String
        public let heldAt: Date
        public let taskResults: [MultipleChoiseTaskResult]
        public let averageScore: Double
        public let subjectID: Subject.ID
        public let subjectName: String
        public let userResults: [UserResult]

        public init(title: String, heldAt: Date, taskResults: [SubjectTest.Results.MultipleChoiseTaskResult], averageScore: Double, subjectID: Subject.ID, subjectName: String, userResults: [SubjectTest.UserResult]) {
            self.title = title
            self.heldAt = heldAt
            self.taskResults = taskResults
            self.averageScore = averageScore
            self.subjectID = subjectID
            self.subjectName = subjectName
            self.userResults = userResults
        }
    }


    public struct CompletionStatus: Codable {
        public init(amountOfCompletedUsers: Int, amountOfEnteredUsers: Int) {
            self.amountOfCompletedUsers = amountOfCompletedUsers
            self.amountOfEnteredUsers = amountOfEnteredUsers
        }

        public var amountOfCompletedUsers: Int
        public var amountOfEnteredUsers: Int

        public var hasEveryoneCompleted: Bool { amountOfEnteredUsers == amountOfCompletedUsers }
    }
}

extension SubjectTest.Results {
    public struct MultipleChoiseTaskResult: Codable {

        public struct Choise: Codable {
            public let choise: String
            public let numberOfSubmissions: Int
            public let percentage: Double
            public let isCorrect: Bool

            public init(choise: String, numberOfSubmissions: Int, percentage: Double, isCorrect: Bool) {
                self.choise = choise
                self.numberOfSubmissions = numberOfSubmissions
                self.percentage = percentage
                self.isCorrect = isCorrect
            }
        }

        public let taskID: Task.ID
        public let question: String
        public let description: String?
        public let choises: [Choise]

        public init(taskID: Int, question: String, description: String?, choises: [SubjectTest.Results.MultipleChoiseTaskResult.Choise]) {
            self.taskID = taskID
            self.question = question
            self.description = description
            self.choises = choises
        }
    }
}
