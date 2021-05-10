//
//  DevIntroduceModel.swift
//  Dolbomi
//
//  Created by DohyunKim on 2021/05/04.
//

import Foundation

class DevIntroduceModel {
    let devArr: [Dev] = [
        Dev.init(image: "도현", name: "김도현", part: "iOS"),
        Dev.init(image: "재훈", name: "양재훈", part: "Server, OS"),
        Dev.init(image: "민영", name: "김민영", part: "Hardware"),
        Dev.init(image: "난희", name: "김난희", part: "Hardware")
    ]
}

struct Dev {
    var image: String
    var name: String
    var part: String
}
