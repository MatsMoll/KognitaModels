/// The data representation the first page the user sees
/// Or the `Dashboard`
public struct Dashboard: Codable {

    public init(subjects: [Subject.ListOverview], ongoingPracticeSession: PracticeSession.ID?, ongoingTestSession: TestSession.ID?, openedTest: SubjectTest.UserOverview?, recommendedRecap: RecommendedRecap?, potensialSubjects: [User.FeideSubject]) {
        self.subjects = subjects
        self.ongoingPracticeSession = ongoingPracticeSession
        self.ongoingTestSession = ongoingTestSession
        self.openedTest = openedTest
        self.recommendedRecap = recommendedRecap
        self.potensialSubjects = potensialSubjects
    }
    
    /// A list of subjects that exists
    public let subjects: [Subject.ListOverview]
    
    /// The currently ongoing practice session if it exists
    public let ongoingPracticeSession: PracticeSession.ID?
    
    /// A current test session if it exists
    public let ongoingTestSession: TestSession.ID?
    
    /// A open subject test if it exists
    public let openedTest: SubjectTest.UserOverview?
    
    /// The recommened recap for a `User`
    public let recommendedRecap: RecommendedRecap?
    
    /// Potensial subjects loaded from Feide
    public let potensialSubjects: [User.FeideSubject]
    
    public var potensialActiveSubjects: [User.FeideSubject] { potensialSubjects.filter { $0.isActive } }
    public var potensialInactiveSubjects: [User.FeideSubject] { potensialSubjects.filter { !$0.isActive } }
    
    /// The users active subjects
    public var activeSubjects: [Subject.ListOverview] { subjects.filter({ $0.isActive }) }
    
    /// The users inactive subjects
    public var inactiveSubjects: [Subject.ListOverview] { subjects.filter({ $0.isActive == false }) }
}
