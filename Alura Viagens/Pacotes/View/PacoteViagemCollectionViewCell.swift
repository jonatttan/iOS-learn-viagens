//
//  PacoteViagemCollectionViewCell.swift
//  Alura Viagens
//
//  Created by Jonattan Moises Sousa on 18/03/21.
//

import UIKit

class PacoteViagemCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imagemViagem: UIImageView!
    
    @IBOutlet weak var labelTitulo: UILabel!
    
    @IBOutlet weak var labelQuantidadeDias: UILabel!
    @IBOutlet weak var labelPreco: UILabel!
    
    func formataCelulaPacotes(pacote:PacoteViagem) {
        
        labelTitulo.text = pacote.viagem.titulo
        labelQuantidadeDias.text = "\(pacote.viagem.quantidadeDeDias) dias"
        labelPreco.text = "R$ \(pacote.viagem.preco)"
        imagemViagem.image = UIImage(named: pacote.viagem.caminhoDaImagem)
        
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor(red: 85.0/255.0, green: 85.0/255.0, blue: 85.0/255.0, alpha: 1).cgColor
        self.layer.cornerRadius = 8
    }
}
