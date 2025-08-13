//
//  ViewController.swift
//  Project1
//
//  Created by Kenay on 07/08/25.
//

import UIKit

class ViewController: UITableViewController {

    var pictures = [String]()//
    
    override func viewDidLoad() {
        super.viewDidLoad()//Faz com que o Xcode execute o codigo dele antes de executar o meu
        
        let fm = FileManager.default //tipo de sistema integrado que nos permite trabalhar com sistema de arquivos, usaremos para o loop nos arquivos
        
        let patch = Bundle.main.resourcePath! // Defini o caminho do recurso do pacote do nosso aplicativo. Bundle é um diretorio para o nosso arquivo
        
        let items = try! fm.contentsOfDirectory(atPath: patch) //Coloca em items os arquivos do patch criado
        
        for item in items {
            if (item.hasPrefix("nssl")){
                pictures.append(item)
            }
        }
        
        print(pictures)
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }//Retorna a quantidade de linhas para a TableView
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)// Faz com que a celula que estiver fora da tela entre em um estado de espera para nao sobrecarregar cpu
        cell.textLabel?.text = pictures[indexPath.row]//Adiciona na tela o texto
        return cell //Retorna uma celula de uma tabela
    }

}

