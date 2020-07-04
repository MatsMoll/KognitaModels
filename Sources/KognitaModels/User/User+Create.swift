import Foundation

extension User {

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

            public enum TermsOfConditionState: String, Codable {
                case accepted
                case notAccepted

                enum Key: CodingKey {
                    case rawValue
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: Key.self)
                    let rawValue = try container.decode(String.self, forKey: .rawValue)
                    switch rawValue {
                    case "on", "true", "yes", "accepted", "accept": self = .accepted
                    default: self = .notAccepted
                    }
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: Key.self)
                    switch self {
                    case .accepted: try container.encode("accepted", forKey: .rawValue)
                    case .notAccepted: try container.encode("notAccepted", forKey: .rawValue)
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
