//
//  CarouselViewController.swift
//  pet-my-mind-challenge
//
//  Created by Guilherme Souza on 18/05/22.
//

import Foundation
import UIKit

class CarouselViewController: UIViewController {

    // MARK: - Subvies
    
    private var carouselView: CarouselView?
    
    // MARK: - Properties
    
    private var carouselData = [CarouselView.CarouselData]()
    private let backgroundColors: [UIColor] = [#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1), #colorLiteral(red: 0.4826081395, green: 0.04436998069, blue: 0.2024421096, alpha: 1), #colorLiteral(red: 0.1728022993, green: 0.42700845, blue: 0.3964217603, alpha: 1), #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1), #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)]
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        carouselView = CarouselView(pages: 5, delegate: self)
        carouselData.append(.init(image: UIImage(named: "Segunda G"), text: "Cachorros adoram cabo de guerra! Faça essa atividade com eles que é garantia de um ótimo tempo de qualidade!"))
        carouselData.append(.init(image: UIImage(named: "Terca G"), text: "Corra por aí com seu cãozinho! Pode ser corrida comum, aproveitar para andar de patins ou até de skate!"))
        carouselData.append(.init(image: UIImage(named: "Quarta G"), text: "Além de ser um ótimo exercício, a natação é uma ótima alternativa para uma atividade física diferente!"))
        carouselData.append(.init(image: UIImage(named: "Quinta G"), text: "Adestrar e gerar costume com escovas dentais e outras coisas fazem com que seu cachorrinho se sinta mais confortável!"))
        carouselData.append(.init(image: UIImage(named: "Sexta G"), text: "Alguns programas são feitos exclusivamente para pets! Procure um filminho especial para ver com seu cachorrinho!"))
        
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        carouselView?.configureView(with: carouselData)
    }
}

// MARK: - Setups
private extension CarouselViewController {
    func setupUI() {
        view.backgroundColor = backgroundColors.first
        
        guard let carouselView = carouselView else { return }
        view.addSubview(carouselView)
        carouselView.translatesAutoresizingMaskIntoConstraints = false
        carouselView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        carouselView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        carouselView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        carouselView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

// MARK: - CarouselViewDelegate
extension CarouselViewController: CarouselViewDelegate {
    func currentPageDidChange(to page: Int) {
        UIView.animate(withDuration: 0.7) {
            self.view.backgroundColor = self.backgroundColors[page]
        }
    }
}
