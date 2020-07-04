extension SubjectTest {
    public enum Enter {
        public struct Request: Decodable {

            public init(password: String) {
                self.password = password
            }

            public let password: String
        }
    }
}
