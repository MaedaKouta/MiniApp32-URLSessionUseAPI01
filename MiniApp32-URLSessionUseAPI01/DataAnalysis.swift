//
//  DataAnalysis.swift
//  MiniApp32-URLSessionUseAPI01
//
//  Created by 前田航汰 on 2022/03/18.
//

import Foundation

/*
protocol DataAnalysisDekegate{
    func iTunesAPICatchMusicData(passedMusicDataArray:[MusicModel])
}


class DataAnalysis{
    var townInfos = [TownInfo]()

    func refleshData(url: URL) -> [TownInfo] {
        let task = URLSession.shared.dataTask(
            with: url,
            completionHandler: { data, response, error in
                if let error = error {
                    print("error", error)
                } else if let data = data {
                    
                    do {
                        let infos = try JSONDecoder().decode(townInfos.self, from: data)
                        for info in infos.results {
                            self.towninfos.append(info)
                        }
                    } catch {
                        print(error)
                        print(error.localizedDescription)
                    }
                }
                return townInfos
            }
        )

        task.resume()
    }

}
 */
