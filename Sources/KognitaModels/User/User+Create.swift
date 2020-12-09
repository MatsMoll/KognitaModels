import Foundation

extension User {
    
    /// Data required to create a user.
    public enum Create {
        /// Data required to create a user.
        public struct Data: Codable {

            public init(username: String, email: String, password: String, verifyPassword: String, acceptedTerms: User.Create.Data.TermsOfConditionState) {
                self.username = username
                self.email = email
                self.password = password
                self.verifyPassword = verifyPassword
                self.acceptedTerms = acceptedTerms
            }

            /// The terms of condition state when creating a user
            public enum TermsOfConditionState: String, Codable {

                case accepted
                case notAccepted

                public init(from decoder: Decoder) throws {
                    let rawValue = try decoder.singleValueContainer().decode(String.self)
                    switch rawValue {
                    case "on", "true", "yes", "accepted", "accept": self = .accepted
                    default: self = .notAccepted
                    }
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.singleValueContainer()
                    switch self {
                    case .accepted: try container.encode("accepted")
                    case .notAccepted: try container.encode("notAccepted")
                    }
                }
            }

            /// User's full name.
            public let username: String

            /// User's email address.
            public let email: String

            /// User's desired password.
            public let password: String

            /// User's password repeated to ensure they typed it correctly.
            public let verifyPassword: String

            /// If the terms is accepted
            public let acceptedTerms: TermsOfConditionState

            /// If the terms is accepted
            public var hasAcceptedTerms: Bool { acceptedTerms == .accepted }
        }

        public typealias Response = User
    }
}
