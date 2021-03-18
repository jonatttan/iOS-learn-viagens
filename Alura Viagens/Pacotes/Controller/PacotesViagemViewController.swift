//
//  PacotesViagemViewController.swift
//  Alura Viagens
//
//  Created by Jonattan Moises Sousa on 18/03/21.
//

import UIKit

class PacotesViagemViewController: UIViewController, UICollectionViewDataSource {

    @IBOutlet weak var colecaoPacotesViagem: UICollectionView!
    
    let listaViagem: Array<Viagem> = ViagemDAO().retornaTodasAsViagens()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colecaoPacotesViagem.dataSource = self
        colecaoPacotesViagem.delegate = self
        //
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
}

extension PacotesViagemViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let larguraCelula = (collectionView.bounds.width / 2) - 8

        return CGSize(width: larguraCelula, height: larguraCelula)

    }

}

