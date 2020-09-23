//
//  ViewController.swift
//  Carros
//
//  Created by Wladmir  on 23/09/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var carArray: [Car] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        downloadApi()
    }

    private func downloadApi() {
        let link = URL(string: "https://apiwlad.herokuapp.com/")!
        URLSession.shared.dataTask(with: link) { (data, response, error) in
            if let data = data {
                do {
                    let carApi = try JSONDecoder().decode([Car].self, from: data)
                    
                    self.carArray.append(contentsOf: carApi)
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                    
                } catch {
                    print("Erro de parse")
                }
            }
        }.resume()
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "carCell", for: indexPath) as? CarViewCell {
            let car = carArray[indexPath.row]
            cell.carName.text = car.name
            cell.carBrand.text = car.brand
            cell.carPrice.text = String(car.value)
            return cell
        } else {
            fatalError("Não foi possivel convertar a celula.")
        }
    }
}

struct Car: Codable {
    public let name, date: String
    public let value: Int
    public let brand, color, createdAt: String
    
    enum CodingKeys: String, CodingKey {
        case name = "nome"
        case date = "data"
        case value = "Valor"
        case brand = "Marca"
        case color = "Cor"
        case createdAt
    }
}
