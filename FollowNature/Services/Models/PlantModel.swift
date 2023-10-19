//
//  PlantModel.swift
//  FollowNature
//
//  Created by Shamil Aglarov on 18.10.2023.
//

struct Welcome: Codable {
    let data: [Datum]
    let links: WelcomeLinks
    let meta: Meta
}

// MARK: - Datum
struct Datum: Codable {
    let id: Int
    let commonName: String?
    let slug, scientificName: String
    let year: Int
    let bibliography, author: String
    let status: Status
    let rank: Rank
    let familyCommonName: JSONNull?
    let genusID: Int
    let imageURL: String?
    let synonyms: [String]
    let genus, family: String
    let links: DatumLinks

    enum CodingKeys: String, CodingKey {
        case id
        case commonName = "common_name"
        case slug
        case scientificName = "scientific_name"
        case year, bibliography, author, status, rank
        case familyCommonName = "family_common_name"
        case genusID = "genus_id"
        case imageURL = "image_url"
        case synonyms, genus, family, links
    }
}

// MARK: - DatumLinks
struct DatumLinks: Codable {
    let linksSelf, plant, genus: String

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case plant, genus
    }
}

enum Rank: String, Codable {
    case species = "species"
}

enum Status: String, Codable {
    case accepted = "accepted"
}

// MARK: - WelcomeLinks
struct WelcomeLinks: Codable {
    let linksSelf, first, last: String

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case first, last
    }
}

// MARK: - Meta
struct Meta: Codable {
    let total: Int
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {
    
    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(0)
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
struct PlantInfo {
    let id: Int
    let scientificName: String
    let family: String
    let genus: String
    let genusID: Int
    let synonyms: [String]
    let commonName: String?
    let imageURL: String?
}
