//
//  Video.swift
//  SwiftUI-List-Starter
//
//  Created by Sean Allen on 4/23/21.
//

import SwiftUI
//
//struct Billionaire: Identifiable {
//    let id = UUID()
//    let imageName: String
//    let FullName: String
//    let NetWorth: String
//    let Country: String
//    let City:String
//    let Age: String
//    let Source: String
//    let Industry: String
//    let Bios: String
//    let viewCount: Int
//    let uploadDate: String
//    let url: URL
//}

//struct BillionaireList {
//
//    static let topTen = [
//        Billionaire(imageName: "Image1",
//                    FullName: "Elon Musk",
//                    NetWorth: "265.69 B",
//                    Country: "United States",
//                    City: "Austin, Texas",
//                    Age:"51",
//                    Source:" Tesla, SpaceX",
//                    Industry:"Automotion",
//                    Bios: "CEO, Tesla",
//                    viewCount:162897,
//
//                    uploadDate: "February 17, 2019",
//                    url: URL(string: "https://www.forbes.com/profile/elon-musk")!),
//
//        Billionaire(imageName: "Image2",
//                    FullName: "Bernard Arnault & family",
//                    NetWorth: "172.17 B",
//                    Country: "France",
//                    City: "Paris, France",
//                    Age: "73",
//                    Source:"LVMH",
//                    Industry: "Fashion",
//                    Bios:"Chairman And CEO, LVMH Moët Hennessy Louis Vuitton",
//
//                    viewCount: 162897,
//                    uploadDate: "May 6, 2017",
//                    url: URL(string: "https://www.forbes.com/profile/bernard")!),
//
//        Billionaire(imageName: "Image3",
//                    FullName: "Jeff Bezos",
//                    NetWorth: "168.02 B",
//                    Country: "United States",
//                    City: "Seattle, Washington",
//                    Age: "58",
//                    Source:"Amazon",
//                    Industry: "Technology",
//                    Bios:"Chairman And Founder, Amazon",
//                    viewCount: 162897,
//                    uploadDate: "May 19, 2017",
//                    url: URL(string: "https://www.forbes.com/profile/jeff-bezos")!),
//
//        Billionaire(imageName: "Image4",
//                    FullName: "SGautam Adani & family",
//                    NetWorth: "131.12 B",
//                    Country: "India",
//                    City: "Ahmedabad, India",
//                    Age: "60",
//                    Source:"infrastructure, commodities",
//                    Industry: "infrastructure",
//                    Bios:"Gautam Adani controls Mundra Port, India's largest, in his home state of Gujarat",
//                    viewCount: 162897,
//                    uploadDate: "May 21, 2017",
//                    url: URL(string: "https://youtu.be/DBWu6TnhLeY")!),
//
//        Billionaire(imageName: "Image5",
//                    FullName: "Bill Gates",
//                    NetWorth: "114.23 B",
//                    Country: "United States",
//                    City: "Medina, Washington",
//                    Age: "67",
//                    Source:"Microsoft",
//                    Industry: "Technology",
//                    Bios:"Cofounder, Bill & Melinda Gates Foundation",
//                    viewCount: 162897,
//                    uploadDate: "July 7, 2017",
//                    url: URL(string: "https://youtu.be/Y0qCWQDRWDw")!)
//
//
//    ]
//}






// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - WelcomeElement

struct WelcomeElement: Codable, Identifiable {
    let id = UUID()
    let name: Name
    let year: Int
    let uri, bio: String
    let rank: Int
    let listURI: ListURI
    let finalWorth: Double
    let person: Person
    let visible: Bool
    let personName: String
    let state, city: String?
    let source: String
    let industries: [Industry]
    let countryOfCitizenship: String
    let timestamp, version: Int
    let naturalID: String
    let position: Int
    let imageExists: Bool
    let gender: Gender?
    let birthDate: Date?
    let lastName: String
    let financialAssets: [FinancialAsset]?
    let date: Int
    let wealthList: Bool
    let estWorthPrev: Double
    let privateAssetsWorth: Double?
    let familyList, interactive: Bool
    let archivedWorth: Int
    let thumbnail: String?
    let squareImage: String?
    let bioSuppress: Bool
    let csfDisplayFields: [CsfDisplayField]
    let bios: [String]
    let abouts: [String]?
    let portraitImage, landscapeImage: String?

    enum CodingKeys: String, CodingKey {
        case name, year, uri, bio, rank
        case listURI = "listUri"
        case finalWorth, person, visible, personName, state, city, source, industries, countryOfCitizenship, timestamp, version
        case naturalID = "naturalId"
        case position, imageExists, gender, birthDate, lastName, financialAssets, date, wealthList, estWorthPrev, privateAssetsWorth, familyList, interactive, archivedWorth, thumbnail, squareImage, bioSuppress, csfDisplayFields, bios, abouts, portraitImage, landscapeImage
    }
}


enum CsfDisplayField: String, Codable {
    case age = "age"
    case bio = "bio"
    case bios = "bios"
    case countryOfCitizenship = "countryOfCitizenship"
    case finalWorth = "finalWorth"
    case personName = "personName"
    case rank = "rank"
    case source = "source"
}

// MARK: - FinancialAsset
struct FinancialAsset: Codable {
    let exchange, ticker: String?
    let companyName: String
    let numberOfShares, sharePrice: Double
    let currencyCode: String
    let exchangeRate: Double
    let interactive: Bool
    let currentPrice, exerciseOptionPrice: Double?
}

enum Gender: String, Codable {
    case f = "F"
    case m = "M"
}

enum Industry: String, Codable {
    case automotive = "Automotive"
    case constructionEngineering = "Construction & Engineering"
    case diversified = "Diversified"
    case energy = "Energy"
    case fashionRetail = "Fashion & Retail"
    case financeInvestments = "Finance & Investments"
    case foodBeverage = "Food & Beverage"
    case gamblingCasinos = "Gambling & Casinos"
    case healthcare = "Healthcare"
    case logistics = "Logistics"
    case manufacturing = "Manufacturing"
    case mediaEntertainment = "Media & Entertainment"
    case metalsMining = "Metals & Mining"
    case realEstate = "Real Estate"
    case service = "Service"
    case sports = "Sports"
    case technology = "Technology"
    case telecom = "Telecom"
}

enum ListURI: String, Codable {
    case rtb = "rtb"
}

enum Name: String, Codable {
    case realTimeBillionaires = "Real-Time Billionaires"
}

// MARK: - Person




typealias Welcome = [WelcomeElement]


