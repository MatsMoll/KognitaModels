public struct Dashboard: Codable {

    public init(subjects: [Subject.ListOverview], ongoingPracticeSession: PracticeSession.ID?, ongoingTestSession: TestSession.ID?, openedTest: SubjectTest.UserOverview?) {
        self.subjects = subjects
        self.ongoingPracticeSession = ongoingPracticeSession
        self.ongoingTestSession = ongoingTestSession
        self.openedTest = openedTest
    }

    public let subjects: [Subject.ListOverview]
    public let ongoingPracticeSession: PracticeSession.ID?
    public let ongoingTestSession: TestSession.ID?
    public let openedTest: SubjectTest.UserOverview?

    public var activeSubjects: [Subject.ListOverview] { subjects.filter({ $0.isActive }) }
    public var inactiveSubjects: [Subject.ListOverview] { subjects.filter({ $0.isActive == false }) }
}
