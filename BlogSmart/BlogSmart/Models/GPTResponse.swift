//
//  GPTResponse.swift
//  BlogSmart
//
//  Created by Michael Dacanay on 4/28/23.
//

import Foundation

struct GPTResponse: Decodable {
    let id: String
    let object: String
    let created: Int
    let model: String
    let usage: Usage
    let choices: [Choice]
}

struct Usage: Decodable {
    let promptTokens: Int
    let completionTokens: Int
    let totalTokens: Int
    
    enum CodingKeys: String, CodingKey {
        case promptTokens = "prompt_tokens"
        case completionTokens = "completion_tokens"
        case totalTokens = "total_tokens"
    }
}

struct Choice: Decodable {
    let message: Message
    let finishReason: String
    let index: Int
    
    enum CodingKeys: String, CodingKey {
        case message
        case finishReason = "finish_reason"
        case index
    }
}

struct Message: Codable {
    let role: String
    let content: String
}
