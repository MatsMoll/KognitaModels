import Foundation

public struct SubjectTest: Codable, Identifiable {

    /// The session id
    public var id: Int

    /// The date when the session was started
    public var createdAt: Date

    /// The id of the subject to test
    public var subjectID: Subject.ID

    /// The duratino of the test
    public var duration: TimeInterval

    /// The time the test is open for entering
    public var openedAt: Date?

    /// The date the test ended
    public var endedAt: Date?

    /// The date the test is suppose to be held at
    public var scheduledAt: Date

    /// The password that is needed in order to enter
    public var password: String

    /// A title describing the test
    public var title: String

    /// A bool represening if is in team based learning mode
    public var isTeamBasedLearning: Bool

    /// The id's of tasks that
    public let taskIDs: [Int]

    public var isOpen: Bool {
        guard
            let openedAt = openedAt,
            let endsAt = endedAt
        else {
            return false
        }
        return openedAt.timeIntervalSinceNow < 0 && endsAt.timeIntervalSinceNow > 0
    }

    public init(id: SubjectTest.ID, createdAt: Date, subjectID: Subject.ID, duration: TimeInterval, openedAt: Date? = nil, endedAt: Date? = nil, scheduledAt: Date, password: String, title: String, isTeamBasedLearning: Bool, taskIDs: [Int]) {
        self.id = id
        self.createdAt = createdAt
        self.subjectID = subjectID
        self.duration = duration
        self.openedAt = openedAt
        self.endedAt = endedAt
        self.scheduledAt = scheduledAt
        self.password = password
        self.title = title
        self.isTeamBasedLearning = isTeamBasedLearning
        self.taskIDs = taskIDs
    }

    func response(with subject: Subject) -> SubjectTest.UserOverview {
        SubjectTest.UserOverview.init(
            test: self,
            subjectName: subject.name,
            subjectID: subject.id,
            hasSubmitted: false,
            testSessionID: nil
        )
    }
}


extension SubjectTest {

    public struct ModifyResponse: Codable {

        public let id: SubjectTest.ID
        public let subjectID: Subject.ID
        public let title: String
        public let createdAt: Date
        public let duration: TimeInterval
        public let scheduledAt: Date
        public let openedAt: Date?
        public let taskIDs: [Task.ID]
        public let password: String
        public let isTeamBasedLearning: Bool

        public var isOpen: Bool { openedAt != nil }

        public var endsAt: Date? {
            guard let openedAt = openedAt else {
                return nil
            }
            return openedAt.addingTimeInterval(duration)
        }

        public init(test: SubjectTest, taskIDs: [Task.ID]) {
            self.id = test.id
            self.subjectID = test.subjectID
            self.title = test.title
            self.createdAt = test.createdAt
            self.scheduledAt = test.scheduledAt
            self.duration = test.duration
            self.openedAt = test.openedAt
            self.taskIDs = taskIDs
            self.password = test.password
            self.isTeamBasedLearning = test.isTeamBasedLearning
        }
    }


    public struct ListReponse: Codable {
        public let subject: Subject

        public let finnishedTests: [SubjectTest.UserOverview]
        public let unopenedTests: [SubjectTest.UserOverview]
        public var ongoingTests: [SubjectTest.UserOverview]

        public init(subject: Subject, tests: [SubjectTest]) {
            self.subject = subject

            var ongoingTests = [SubjectTest.UserOverview]()
            var unopendTests = [SubjectTest.UserOverview]()
            var finnishedTests = [SubjectTest.UserOverview]()

            tests.forEach { test in
                if test.endedAt == nil {
                    unopendTests.append(test.response(with: subject))
                } else if test.isOpen {
                    ongoingTests.append(test.response(with: subject))
                } else {
                    finnishedTests.append(test.response(with: subject))
                }
            }
            self.ongoingTests = ongoingTests
            self.unopenedTests = unopendTests
            self.finnishedTests = finnishedTests
        }
    }
}
