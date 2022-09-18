//
//  ViewController.swift
//  TableViewProject-Course
//
//  Created by MacbookPro on 18/09/22.
//

import UIKit

struct Task {
    var name: String
    var done: Bool
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tasks = [Task(name: "Assistir Aula IOS", done: true), Task(name: "Fazer Inscricao Bootcamp", done: true), Task(name: "Fazer Aula de Ingles", done: true), Task(name: "Conseguir Vaga IOS", done: false)]
    
    lazy var tableView:UITableView={
        var table = UITableView()
        return table
    }()
    
    var login:LoginProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        title = "Metas"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -0),
        ])
        
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ _tableView: UITableView,cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        if tasks[indexPath.row].done{
            cell.accessoryType = .checkmark
        }else{
            cell.accessoryType = .none
        }
        cell.textLabel?.text=tasks[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else{return}
        tasks[indexPath.row].done = !tasks[indexPath.row].done
        let task = tasks[indexPath.row]
        var title = "Parabens!"
        var message = "Voce concluiu a tarefa \(task.name)"
        if task.done {
            cell.accessoryType = .checkmark
        }else{
            cell.accessoryType = .none
            title = "Ops!"
            message = "Nao Desista de Suas Metas!!!"
        }
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        present(alert, animated: true)
    }
}

