//
//  ViewController.swift
//  pet-my-mind-challenge
//
//  Created by Guilherme Souza on 15/05/22.
//

import UIKit

class ViewController: UIViewController {

    let porte = ["Pequeno/Médio", "Grande"]
    let planejamento = ["Para o dia", "Para a semana"]
    let atividade = ["Para Suar", "Para Relaxar"]
    var pickerViewPorte = UIPickerView()
    var pickerViewPlan = UIPickerView()
    var pickerViewAtiv = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        porteTextField.inputView = pickerViewPorte
        planTextField.inputView = pickerViewPlan
        ativTextField.inputView = pickerViewAtiv

        porteTextField.textAlignment = .center
        planTextField.textAlignment = .center
        ativTextField.textAlignment = .center

        pickerViewPorte.delegate = self
        pickerViewPorte.dataSource = self
        pickerViewPlan.delegate = self
        pickerViewPlan.dataSource = self
        pickerViewAtiv.delegate = self
        pickerViewAtiv.dataSource = self

        pickerViewPorte.tag = 1
        pickerViewPlan.tag = 2
        pickerViewAtiv.tag = 3
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            view.endEditing(true)
    }


    @IBOutlet weak var porteLabel: UILabel!
    @IBOutlet weak var porteTextField: UITextField!
    @IBOutlet weak var planLabel: UILabel!
    @IBOutlet weak var planTextField: UITextField!
    @IBOutlet weak var ativLabel: UILabel!
    @IBOutlet weak var ativTextField: UITextField!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var confirmButton2: UIButton!
    @IBOutlet weak var confirmButtonOff: UIButton!
    @IBOutlet weak var confirmButton3: UIButton!
    
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {


    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1:
            return porte.count
        case 2:
            return planejamento.count
        case 3:
            return atividade.count
        default:
            return 1
        }
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1:
            return porte[row]
        case 2:
            return planejamento[row]
        case 3:
            return atividade[row]
        default:
            return "Informação não encontrada"
        }
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1:
            porteTextField.text! = porte[row]
            porteTextField.resignFirstResponder()
        case 2:
            planTextField.text! = planejamento[row]
            if planejamento[row].elementsEqual("Para o dia") {
                ativTextField.isHidden = false
                ativLabel.isHidden = false
                confirmButton.isHidden = true
            } else {
                ativTextField.isHidden = true
                ativLabel.isHidden = true
                if porteTextField.hasText {
                    confirmButton.isHidden = false
                    confirmButtonOff.isHidden = true
                }
            }
            planTextField.resignFirstResponder()
        case 3:
            ativTextField.text! = atividade[row]
            if atividade[row].elementsEqual("Para Suar") {
                confirmButton2.isHidden = false
                confirmButton3.isHidden = true
            } else {
                confirmButton3.isHidden = false
                confirmButton2.isHidden = true
            }
            ativTextField.resignFirstResponder()
            
        default:
            return
        }
    }

}
