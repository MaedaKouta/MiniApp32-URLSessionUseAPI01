//
//  ViewController.swift
//  MiniApp32-URLSessionUseAPI01
//
//  Created by 前田航汰 on 2022/03/18.
//

import UIKit
import Foundation


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    struct TownInfo: Codable {

        let total: Int
        let start: Int
        let count: Int
        let results: [ResultJson]

        struct ResultJson: Codable {
            let localGovernmentCode: String
            let addressPrefecture: String
            let addressCity: String
            let recruitingSitePrefecture: String
            let recruitingUrlPrefecture: String
            let cityPrSitePrefecture: String
            let cityPrUrlPrefecture: String
            let cityPrSiteLocal: String
            let cityPrUrlLocal: String
            let cpName: String
            let yTownInfoId: String
        }
    }

    @IBOutlet weak var tableView: UITableView!
    var townInfos = [TownInfo.ResultJson]()
    let url = URL(string: "https://job.yahooapis.jp/v1/furusato/towninfo/?appid=dj00aiZpPVdDNkxhQ2Y5Rm0yQSZzPWNvbnN1bWVyc2VjcmV0Jng9ZTU-&results=50&number=352039")!

    // 非同期処理が終了した時点でTableViewをreloadDataしたかった。
    // ただその方法に躓いたため、全くの不適切だがsleepを用いることで一時的に問題を解決した。
    // 次回以降のMiniAppでこの問題に取り組む。
    override func viewDidLoad() {
        super.viewDidLoad()
        refleshData()
        sleep(5)
        reload()
    }

    func reload() {
        sleep(5)
        tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        townInfos.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = townInfos[indexPath.row].cityPrSiteLocal
        return cell
    }

    func refleshData() {
        print("開始")
        URLSession.shared.dataTask(
            with: url,
            completionHandler: { data, response, error in
                if let error = error {
                    print("error", error)
                } else if let data = data {

                    do {
                        let infos = try JSONDecoder().decode(TownInfo.self, from: data)
                        for info in infos.results {
                            print("2")
                            print(info)
                            self.townInfos.append(info)
                        }
                    } catch {
                        print(error)
                        print(error.localizedDescription)
                    }
                }
                print(self.townInfos)
            }
        ).resume()
    }

}


