import Foundation

/// Public representation of user data.
public struct User: Codable, Identifiable {

    public init(id: Int, username: String, email: String, registrationDate: Date, isAdmin: Bool, isEmailVerified: Bool, pictureUrl: String?) {
        self.id = id
        self.username = username
        self.email = email
        self.registrationDate = registrationDate
        self.isAdmin = isAdmin
        self.isEmailVerified = isEmailVerified
        self.pictureUrl = pictureUrl
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
    
    /// The url for a picture if provided
    public let pictureUrl: String?
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


public enum Feide {
    
    /// The data returnd when fetching a Feide's user info
    public struct UserInfo: Codable {
        
        /// The different JSON coding keys to use
        enum CodingKeys: String, CodingKey {
            case email
//            case name
            case isEmailVerified = "email_verified"
            case pictureUrl = "picture"
        }
        
        /// The email assosiated with the user
        public let email: String
        
//        /// The name of the user
//        public let name: String
        
        /// If the email is verified
        public let isEmailVerified: Bool
        
        /// A url to there picture if added
        public let pictureUrl: String?
    }
    
    /// The content returned when a user grants Kognita the privelage to use Feide
    public struct Grant: Codable {
        
        public init(code: String, state: String?) {
            self.code = code
            self.state = state
        }
        
        /// A code iding the user
        public let code: String
        
        /// A state that can be used to identify the auth request
        public let state: String?
    }
    
    /// A request to get a access token in the Feide services
    public struct AccessTokenRequest: Codable {
        
        public init(code: String, redirectURI: String, clientID: String, grantType: String = "authorization_code") {
            self.code = code
            self.redirectURI = redirectURI
            self.clientID = clientID
            self.grantType = grantType
        }
        
        
        /// The different JSON coding keys to use
        enum CodingKeys: String, CodingKey {
            case code
            case redirectURI = "redirect_uri"
            case clientID = "client_id"
            case grantType = "grant_type"
        }
        
        /// The code returned from the `Grant`
        public let code: String
        
        /// The expected redirect uri
        public let redirectURI: String
        
        /// The Feide client ID
        public let clientID: String
        
        /// The grant type
        public var grantType: String = "authorization_code"
    }
    
    /// A access token that identifies a Feide user
    public struct AccessToken: Codable {
        
        /// The different JSON coding keys to use
        enum CodingKeys: String, CodingKey {
            case accessToken = "access_token"
            case tokenType = "token_type"
            case expiresIn = "expires_in"
            case scope
        }
        
        /// The access token identifing the user
        public let accessToken: String
        
        /// The token type. Most likely a bearer
        public let tokenType: String
        
        /// When it expires
        public let expiresIn: Int
        
        /// The scope of the data that is accessable
        public let scope: String
    }
    
    public struct JWKS: Codable {
        
    }
    
    public struct Membership: Codable {
        
        enum CodingKeys: String, CodingKey {
            case active
            case notActiveAfter = "notAfter"
            case displayName
        }
        
        /// A is active variable from feide
        private let active: Bool
        public let notActiveAfter: Date?
        public let displayName: String
        
        public var isActive: Bool {
            guard active, let notActiveAfter = notActiveAfter else { return false }
            return Date() < notActiveAfter
        }
    }
    
    public struct Subject: Codable {
        public let id: String
        public let displayName: String
        public let membership: Membership?
        
        public var isActive: Bool { membership?.isActive == true }
    }
    
    public enum Group: Decodable {
        
        enum CodingError: Error {
            case unableToDecodeType
        }
        
        enum CodingKeys: String, CodingKey {
            case type
        }
        
        case subject(Subject)
        case unknown
        
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            guard let type = try container.decode(String.self, forKey: .type).split(separator: ":").last else {
                throw CodingError.unableToDecodeType
            }
            switch type.lowercased() {
            case "emne": try self = .subject(Subject.init(from: decoder))
            default: self = .unknown
            }
        }
    }
}

extension User {
    public struct FeideSubject: Identifiable, Codable {
        
        public init(id: Int, groupID: String, userID: User.ID, subjectID: Subject.ID?, code: String, name: String, activeUntil: Date?, wasViewedAt: Date?, role: String) {
            self.id = id
            self.groupID = groupID
            self.userID = userID
            self.subjectID = subjectID
            self.name = name
            self.code = code
            self.activeUntil = activeUntil
            self.wasViewedAt = wasViewedAt
            self.role = role
        }
        
        public let id: Int
        public let groupID: String
        public let userID: User.ID
        public let subjectID: Subject.ID?
        public let code: String
        public let name: String
        public let activeUntil: Date?
        public let wasViewedAt: Date?
        public let role: String
        
        public var isActive: Bool {
            guard let activeUntil = activeUntil else { return true }
            return activeUntil > Date()
        }
    }
}

extension User.FeideSubject {
    
    public struct Update: Codable {
        public let id: User.FeideSubject.ID
        public let isActive: Bool
    }
    
    public struct Detail: Codable {
        public let id: Int
        public let subjectCode: String
        public let subjectName: String
        public let activeUntil: Date
        public let wasViewedAt: Date?
        public let role: String
    }
}
