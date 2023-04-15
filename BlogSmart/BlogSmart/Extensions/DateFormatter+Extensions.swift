//
//  DateFormatter+Extensions.swift
//  BlogSmart
//
//  Created by Edwin Dake on 4/14/23.
//

import Foundation

extension DateFormatter {
    static var postFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        return formatter
    }()
}
