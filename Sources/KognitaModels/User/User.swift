import Foundation

/// Public representation of user data.
public struct User: Codable, Identifiable {

    public init(id: Int, username: String, email: String, registrationDate: Date, isAdmin: Bool, isEmailVerified: Bool) {
        self.id = id
        self.username = username
        self.email = email
        self.registrationDate = registrationDate
        self.isAdmin = isAdmin
        self.isEmailVerified = isEmailVerified
    }


    /// User's unique identifier.
    /// Not optional since we only return users that exist in the DB.
    public let id: Int

    /// User's full name.
    public let username: String

    /// User's email address.
    public let email: String

    /// The User's registration date
    public let registrationDate: Date

    /// If the `User` has admin privilege
    public let isAdmin: Bool

    /// If the users email has been verified
    public let isEmailVerified: Bool
}


extension User {
    public enum Login {
        public struct Token: Codable, Identifiable {

            public var id: Int

            /// Unique token string.
            public var string: String

            /// Reference to user that owns this token.
            public var userID: User.ID

            /// Expiration date. Token will no longer be valid after this point.
            public var expiresAt: Date?

            /// Creates a new `User.Login.Token`.
            public init(id: Int, string: String, userID: User.ID, expiresAt: Date? = nil) {
                self.id = id
                self.string = string
                self.userID = userID
                self.expiresAt = expiresAt
            }
        }
    }
}

extension User {
    public enum ResetPassword {
        public struct Token: Codable {
            public init(token: String) {
                self.token = token
            }

            public let token: String
        }
    }
}

extension User {
    public enum VerifyEmail {
        public struct EmailContent: Codable {
            public init(token: String, userID: User.ID, email: String) {
                self.token = token
                self.userID = userID
                self.email = email
            }

            public let token: String
            public let userID: User.ID
            public let email: String
        }

        public struct Token: Codable {
            public let token: String

            public init(token: String) {
                self.token = token
            }
        }
    }
}
