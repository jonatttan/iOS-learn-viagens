//
//  PacotesViagemViewController.swift
//  Alura Viagens
//
//  Created by Jonattan Moises Sousa on 18/03/21.
//

import UIKit

class PacotesViagemViewController: UIViewController, UICollectionViewDataSource, UISearchBarDelegate, UICollectionViewDelegate {

    @IBOutlet weak var colecaoPacotesViagem: UICollectionView!
    @IBOutlet weak var pesquisaViagens: UISearchBar!
    @IBOutlet weak var labelContadorPacotes: UILabel!
    
    let listaAllViagem: Array<PacoteViagem> = PacoteViagemDAO().retornaTodasAsViagens()
    var listaViagem: Array<PacoteViagem> = []
    
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
        
        let pacoteAtual = listaViagem[indexPath.item] //Item? sera?

        celulaPacote.labelTitulo.text = pacoteAtual.viagem.titulo
        celulaPacote.labelQuantidadeDias.text = "\(pacoteAtual.viagem.quantidadeDeDias) dias"
        celulaPacote.labelPreco.text = "R$ \(pacoteAtual.viagem.preco)"
        celulaPacote.imagemViagem.image = UIImage(named: pacoteAtual.viagem.caminhoDaImagem)
        
        celulaPacote.layer.borderWidth = 0.5
        celulaPacote.layer.borderColor = UIColor(red: 85.0/255.0, green: 85.0/255.0, blue: 85.0/255.0, alpha: 1).cgColor
        celulaPacote.layer.cornerRadius = 8
        return celulaPacote
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let pacote = listaViagem[indexPath.item]
        let stoyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard?.instantiateViewController(withIdentifier: "detalhes") as! DetalhesViagemViewController
        controller.pacoteSelecionado = pacote
        self.present(controller, animated: true, completion: nil)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        listaViagem = listaAllViagem
        if searchText != "" {
            let filtroListaViagem = NSPredicate(format: "titulo contains[cd] %@", searchText)
            let listaFiltrados:Array<PacoteViagem> = (listaViagem as NSArray).filtered(using: filtroListaViagem) as! Array
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

