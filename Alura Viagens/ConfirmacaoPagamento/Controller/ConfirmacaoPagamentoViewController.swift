//
//  ConfirmacaoPagamentoViewController.swift
//  Alura Viagens
//
//  Created by Jonattan Moises Sousa on 19/03/21.
//

import UIKit

class ConfirmacaoPagamentoViewController: UIViewController {

    @IBOutlet weak var imagemViagem: UIImageView!
    @IBOutlet weak var labelHotelPacoteViagem: UILabel!
    @IBOutlet weak var labelDataPacoteViagem: UILabel!
    @IBOutlet weak var labelTituloPacoteViagem: UILabel!
    @IBOutlet weak var labelQuantidadePessoas: UILabel!
    @IBOutlet weak var labemDescricaoPacoteviagem: UILabel!
    @IBOutlet weak var botaVoltarHome: UIButton!
    
    var pacoteComprado:PacoteViagem? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let pacote = pacoteComprado {
            self.imagemViagem.image = UIImage(named: pacote.viagem.caminhoDaImagem)
            self.labelHotelPacoteViagem.text = pacote.nomeDoHotel
            self.labelDataPacoteViagem.text = pacote.dataViagem
            self.labelTituloPacoteViagem.text = pacote.viagem.titulo.uppercased()
            self.labemDescricaoPacoteviagem.text = pacote.descricao
            
            self.imagemViagem.layer.cornerRadius = 10
            self.imagemViagem.contentMode = .scaleAspectFill
            
            self.botaVoltarHome.layer.cornerRadius = 10
        }
    }

    @IBAction func botaoVoltarHome(_ sender: UIButton) {
        if let navigation = self.navigationController {
            navigation.popToRootViewController(animated: true)
        }
    }
}
