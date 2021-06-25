//
//  NewsDAO.swift
//  NewsProject
//
//  Created by Naomi Ortiz González on 6/22/21.
//  Copyright © 2021 Naomi Ortiz Gonzalez. All rights reserved.
//

import SwiftUI

struct NewsDAO: Codable{
    var  articles: [Articles]
}
//codable: parse
//Identifiable:para recorrer el arreglo
//?: indica que el atributo puede ser nulo, !:indica que el atributo no puede ser nulo
struct Articles : Codable{
    var author            : String?
    var title             : String
    var description       : String?
    var url               : String
    var urlToImage        : String?
    var publishedAt       : String
    var content           : String?
}


