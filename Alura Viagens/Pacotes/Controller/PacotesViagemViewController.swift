//
//  PacotesViagemViewController.swift
//  Alura Viagens
//
//  Created by Jonattan Moises Sousa on 18/03/21.
//

import UIKit

class PacotesViagemViewController: UIViewController, UICollectionViewDataSource, UISearchBarDelegate {

    @IBOutlet weak var colecaoPacotesViagem: UICollectionView!
    @IBOutlet weak var pesquisaViagens: UISearchBar!
    @IBOutlet weak var labelContadorPacotes: UILabel!
    
    let listaAllViagem: Array<Viagem> = ViagemDAO().retornaTodasAsViagens()
    var listaViagem: Array<Viagem> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listaViagem = listaAllViagem
        colecaoPacotesViagem.dataSource = self
        colecaoPacotesViagem.delegate = self
        pesquisaViagens.delegate = self
        self.labelContadorPacotes.text = self.atualizaContadorLabel()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.listaViagem.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celulaPacote = collectionView.dequeueReusableCell(withReuseIdentifier: "celulaPacote", for: indexPath) as! PacoteViagemCollectionViewCell
        //celulaPacote.backgroundColor = UIColor.blue
        
        let viagemAtual = listaViagem[indexPath.item] //Item? sera?

        celulaPacote.labelTitulo.text = viagemAtual.titulo
        celulaPacote.labelQuantidadeDias.text = "\(viagemAtual.quantidadeDeDias) dias"
        celulaPacote.labelPreco.text = "R$ \(viagemAtual.preco)"
        celulaPacote.imagemViagem.image = UIImage(named: viagemAtual.caminhoDaImagem)
//        celulaPacote.imagemViagem.layer.cornerRadius = 10
//        celulaPacote.imagemViagem.contentMode = .scaleAspectFill
        
        celulaPacote.layer.borderWidth = 0.5
        celulaPacote.layer.borderColor = UIColor(red: 85.0/255.0, green: 85.0/255.0, blue: 85.0/255.0, alpha: 1).cgColor
        celulaPacote.layer.cornerRadius = 8
        return celulaPacote
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        listaViagem = listaAllViagem
        if searchText != "" {
            let filtroListaViagem = NSPredicate(format: "titulo contains %@", searchText)
            let listaFiltrados:Array<Viagem> = (listaViagem as NSArray).filtered(using: filtroListaViagem) as! Array
            listaViagem = listaFiltrados
        }
        self.labelContadorPacotes.text = self.atualizaContadorLabel()
        colecaoPacotesViagem.reloadData()
        //print(searchText)
    }
    
    func atualizaContadorLabel() -> String{
        return listaViagem.count == 1 ? "1 pacote encontrado" : "\(listaViagem.count) pacotes encontrados"
    }
}

extension PacotesViagemViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let larguraCelula = (collectionView.bounds.width / 2) - 8

        return CGSize(width: larguraCelula, height: larguraCelula)

    }

}

