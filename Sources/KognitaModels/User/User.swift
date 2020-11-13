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

        /// A user login token to identify a user
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
        /// A token needed to reset a password
        public struct Token: Codable {
            public init(token: String) {
                self.token = token
            }

            /// The token value
            public let token: String
        }
    }
}

extension User {
    public enum VerifyEmail {
        /// The content used to render a verify email
        public struct EmailContent: Codable {

            public init(token: String, userID: User.ID, email: String) {
                self.token = token
                self.userID = userID
                self.email = email
            }

            /// The verify token
            public let token: String

            /// The user id of the user beeing verified
            public let userID: User.ID

            /// The users email
            public let email: String
        }

        /// The token of a verify email
        public struct Token: Codable {

            /// The token value
            public let token: String

            public init(token: String) {
                self.token = token
            }
        }
    }
}
