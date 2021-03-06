//
//  ViewController.swift
//  Alura Viagens
//
//  Created by Jonattan Moises Sousa on 16/03/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var viewHoteis: UIView!
    @IBOutlet weak var viewPacotes: UIView!
    @IBOutlet weak var tabelaViagens: UITableView!
    
    let listaViagens: Array<Viagem> = ViagemDAO().retornaTodasAsViagens()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabelaViagens.dataSource = self
        self.tabelaViagens.delegate = self
        self.viewPacotes.layer.cornerRadius = 10
        self.viewHoteis.layer.cornerRadius = 10
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaViagens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let viagemAtual = listaViagens[indexPath.row]
        //cell.textLabel?.text = viagemAtual.titulo
        cell.labelTitulo.text = viagemAtual.titulo
        cell.labelQuantidadeDias.text = "\(viagemAtual.quantidadeDeDias) dias"
        cell.labelPreco.text = "R$ \(viagemAtual.preco)"
        cell.imagemViagem.image =  UIImage(named: viagemAtual.caminhoDaImagem)
        //cell.imagemViagem.clipsToBounds = true
        //cell.imagemViagem.layer.masksToBounds = true
        cell.imagemViagem.layer.cornerRadius = 10
        cell.imagemViagem.contentMode = .scaleAspectFill
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone ? 175 : 260
    }

}

