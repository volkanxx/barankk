//
//  ViewController.swift
//  BaranKS
//
//  Created by Baran Ambalaj A.Ş. on 29.09.2017.
//  Copyright © 2017 Baran Ambalaj A.Ş. All rights reserved.
//

import UIKit
import AEXML
import Alamofire
import NVActivityIndicatorView

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate , UITextFieldDelegate, NSURLConnectionDelegate, XMLParserDelegate, NVActivityIndicatorViewable{
  
    
    var myDataArray = ["Seçiniz"]
    var myDataArrayKod = ["Seçiniz"]
    
    
    //@IBOutlet weak var pkont1: UIPickerView!
    //@IBOutlet weak var pkont2: UIPickerView!


    
    @IBOutlet weak var tkont1: UITextField!
    @IBOutlet weak var tkont2: UITextField!
    let  secpickereview1 = UIPickerView()
    let  secpickereview2 = UIPickerView()
    
    
    var secilendenpi1: String?
    var secilendenpi2: String?
    
    @IBOutlet weak var baskibtn: UIButton!
    @IBOutlet weak var lambtn: UIButton!
    @IBOutlet weak var dilbtn: UIButton!
    @IBOutlet weak var aktarmabtn: UIButton!
    @IBOutlet weak var pstbtn: UIButton!
    @IBOutlet weak var murekbtn: UIButton!
    @IBOutlet weak var klisebtn: UIButton!
    @IBOutlet weak var depohambtn: UIButton!
    @IBOutlet weak var deposevbtn: UIButton!
    @IBOutlet weak var sevkbtn: UIButton!
    @IBOutlet weak var paketbtn: UIButton!
    @IBOutlet weak var envbtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        if actions(veri: "WGSM") == "OK"
        {
            
            secilendenpi1=myDataArray[0];
            secilendenpi2=myDataArray[0];
        }
        
        
    }
    
    
    //bitti butonu
    func doneButton() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Tamam", style: .plain, target: self, action: #selector(dismissPicker) )
        
        
        toolBar.setItems([doneButton], animated: true)
        toolBar.isUserInteractionEnabled = true
        
        tkont1.inputAccessoryView = toolBar
        tkont2.inputAccessoryView = toolBar
        
        
        
    }
    @objc func dismissPicker()
    {
        view.endEditing(true)
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
    
    @IBAction func bt1(_ sender: UIButton) {
        
        if secilendenpi1=="Seçiniz"
        {
            let alertController = UIAlertController(title: "Uyarı", message: "Lütfen en az bir DENETÇİ seçiniz!", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "Kapat", style: .default, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
            
        }
        else
        {
        MyClass.bolumadi1 = baskibtn.currentTitle!
        MyClass.bolumadi1kod = "1100"
        self.performSegue(withIdentifier: "menudengecis1", sender: "1")
        }
        
        
    }
    @IBAction func btn2(_ sender: Any) {
        if secilendenpi1=="Seçiniz"
        {
            let alertController = UIAlertController(title: "Uyarı", message: "Lütfen en az bir DENETÇİ seçiniz!", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "Kapat", style: .default, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
            
        }
        else
        {
         MyClass.bolumadi1 = lambtn.currentTitle!
        MyClass.bolumadi1kod = "1300"
        self.performSegue(withIdentifier: "menudengecis1", sender: "2")
        }
    }
    @IBAction func btn3(_ sender: Any) {
        if secilendenpi1=="Seçiniz"
        {
            let alertController = UIAlertController(title: "Uyarı", message: "Lütfen en az bir DENETÇİ seçiniz!", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "Kapat", style: .default, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
            
        }
        else
        {
         MyClass.bolumadi1 = dilbtn.currentTitle!
        MyClass.bolumadi1kod = "1200"
        self.performSegue(withIdentifier: "menudengecis1", sender: "3")
        }
    }
    @IBAction func btn4(_ sender: Any) {
        if secilendenpi1=="Seçiniz"
        {
            let alertController = UIAlertController(title: "Uyarı", message: "Lütfen en az bir DENETÇİ seçiniz!", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "Kapat", style: .default, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
            
        }
        else
        {
         MyClass.bolumadi1 = aktarmabtn.currentTitle!
        MyClass.bolumadi1kod = "1180"
        self.performSegue(withIdentifier: "menudengecis1", sender: "4")
        }
    }
    @IBAction func btn5(_ sender: Any) {
        if secilendenpi1=="Seçiniz"
        {
            let alertController = UIAlertController(title: "Uyarı", message: "Lütfen en az bir DENETÇİ seçiniz!", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "Kapat", style: .default, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
            
        }
        else
        {
         MyClass.bolumadi1 = pstbtn.currentTitle!
        MyClass.bolumadi1kod = "1400"
        self.performSegue(withIdentifier: "menudengecis1", sender: "5")
        }
    }
    @IBAction func btn6(_ sender: Any) {
        if secilendenpi1=="Seçiniz"
        {
            let alertController = UIAlertController(title: "Uyarı", message: "Lütfen en az bir DENETÇİ seçiniz!", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "Kapat", style: .default, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
            
        }
        else
        {
         MyClass.bolumadi1 = murekbtn.currentTitle!
        MyClass.bolumadi1kod = "4001"
        self.performSegue(withIdentifier: "menudengecis1", sender: "6")
        }
    }
    @IBAction func btn7(_ sender: Any) {
        if secilendenpi1=="Seçiniz"
        {
            let alertController = UIAlertController(title: "Uyarı", message: "Lütfen en az bir DENETÇİ seçiniz!", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "Kapat", style: .default, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
            
        }
        else
        {
         MyClass.bolumadi1 = klisebtn.currentTitle!
        MyClass.bolumadi1kod = "3001"
        self.performSegue(withIdentifier: "menudengecis1", sender: "7")
        }
    }
    @IBAction func btn8(_ sender: Any) {
        if secilendenpi1=="Seçiniz"
        {
            let alertController = UIAlertController(title: "Uyarı", message: "Lütfen en az bir DENETÇİ seçiniz!", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "Kapat", style: .default, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
            
        }
        else
        {
         MyClass.bolumadi1 = depohambtn.currentTitle!
        MyClass.bolumadi1kod = "5101"
        self.performSegue(withIdentifier: "menudengecis1", sender: "8")
        }
    }
    @IBAction func btn9(_ sender: Any) {
        if secilendenpi1=="Seçiniz"
        {
            let alertController = UIAlertController(title: "Uyarı", message: "Lütfen en az bir DENETÇİ seçiniz!", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "Kapat", style: .default, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
            
        }
        else
        {
         MyClass.bolumadi1 = deposevbtn.currentTitle!
        MyClass.bolumadi1kod = "5102"
        self.performSegue(withIdentifier: "menudengecis1", sender: "9")
        }
    }
    @IBAction func btn10(_ sender: Any) {
        if secilendenpi1=="Seçiniz"
        {
            let alertController = UIAlertController(title: "Uyarı", message: "Lütfen en az bir DENETÇİ seçiniz!", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "Kapat", style: .default, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
            
        }
        else
        {
         MyClass.bolumadi1 = sevkbtn.currentTitle!
        MyClass.bolumadi1kod = "3500"
        self.performSegue(withIdentifier: "menudengecis1", sender: "10")
        }
    }
    @IBAction func btn11(_ sender: Any) {
        if secilendenpi1=="Seçiniz"
        {
            let alertController = UIAlertController(title: "Uyarı", message: "Lütfen en az bir DENETÇİ seçiniz!", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "Kapat", style: .default, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
            
        }
        else
        {
         MyClass.bolumadi1 = paketbtn.currentTitle!
        MyClass.bolumadi1kod = "4000"
        self.performSegue(withIdentifier: "menudengecis1", sender: "11")
        }
    }
    @IBAction func btn12(_ sender: Any) {
        if secilendenpi1=="Seçiniz"
        {
            let alertController = UIAlertController(title: "Uyarı", message: "Lütfen en az bir DENETÇİ seçiniz!", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "Kapat", style: .default, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
            
        }
        else
        {
         MyClass.bolumadi1 = envbtn.currentTitle!
        MyClass.bolumadi1kod = "4006"
        self.performSegue(withIdentifier: "menudengecis1", sender: "12")
        //self.performSegue(withIdentifier: "menudengecis1", sender: self)
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "menudengecis1"
        {
           
            if let navdegisken = segue.destination as? UINavigationController
            {
                if let controldegisken = navdegisken.viewControllers[0] as? TipSecList
                {
                    if (sender) as! String == "1"
                    {
                        // sonraki sayfaya değişken gönderme
                       //  controldegisken.topobjebasliktext = baskibtn.currentTitle
                    }
                    
                   
                }
               
            }
            
        }
       
    }
    
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       return myDataArray.count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return myDataArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
       
        
        if pickerView.tag == 1
        {
            
        secilendenpi1=myDataArrayKod[row]
        tkont1.text = myDataArray[row]
        let str1 = secilendenpi1!
        MyClass.denetci1 = str1
            
            
        }
        else if pickerView.tag == 2
        {
            
        secilendenpi2=myDataArrayKod[row]
        tkont2.text = myDataArray[row]
        let str2 = secilendenpi2!
        MyClass.denetci2 = str2
            
            
            
        }
        else
        {
            return
        }
        
    }
    
    
    
    
    
    func actions (veri:String) -> NSString
    {
        
        let view = NVActivityIndicatorView(frame: CGRect(x: 350, y: 450, width: 150, height: 150))
        view.color = UIColor.red
        view.type = .ballClipRotate
        view.padding = 0
        view.startAnimating()
        self.view.addSubview(view)
        
        
        let celcius = veri
        var is_SoapMessage: String = "<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:cgs=\"http://tempuri.org/\"><soapenv:Header/><soapenv:Body><cgs:denetcilist><cgs:xparametre>\(celcius)</cgs:xparametre></cgs:denetcilist></soapenv:Body></soapenv:Envelope>"
        
        var theRequest = URLRequest(url: URL(string: "http://onay.baranambalaj.com.tr/ipad.asmx")!)
        
        let session = URLSession.shared
        
        theRequest.httpMethod = "POST"
        theRequest.httpBody = is_SoapMessage.data(using: String.Encoding.utf8)
        theRequest.addValue("onay.baranambalaj.com.tr", forHTTPHeaderField: "Host")
        theRequest.addValue("text/xml; charset=utf-8", forHTTPHeaderField: "Content-Type")
        theRequest.addValue(String(is_SoapMessage.characters.count), forHTTPHeaderField: "Content-Length")
        theRequest.addValue("http://tempuri.org/denetcilist", forHTTPHeaderField: "SOAPAction")
        
        
        let task = session.dataTask(with: theRequest, completionHandler: {data, response, error -> Void in
            let strData = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            //print("Body: \(String(describing: strData))")
            
            /*oku*/
            DispatchQueue.global(priority: DispatchQueue.GlobalQueuePriority.default).async(execute: {
                DispatchQueue.main.async(execute: {
                    Alamofire.request("http://onay.baranambalaj.com.tr/XMLFILE/"+veri+"denetcilist.xml").response { response in
                        guard let xmlData = response.data else {return}
                        let options = AEXMLOptions()
                        do
                        {
                            
                            let xmlDoc = try AEXMLDocument(xml: xmlData, options: options)
                            //print(xmlDoc.root["Table"]["STEXT"].value!)
                            if let items = xmlDoc.root["Table"].all{
                                
                                for item in items{
                                    self.myDataArray.append(item["DISPLAY"].string)
                                    self.myDataArrayKod.append(item["USERNAME"].string)
                                   
                                }
                            }
                            
                            //self.pkont1!.dataSource = self
                            //self.pkont1!.delegate = self
                            //self.pkont2!.dataSource = self
                            //self.pkont2!.delegate = self
                            //self.pkont1.tag = 1
                           // self.pkont2.tag = 2
                            
                            self.secpickereview1.dataSource = self
                            self.secpickereview1.delegate = self
                            self.secpickereview2.dataSource = self
                            self.secpickereview2.delegate = self
                            self.secpickereview1.tag = 1
                            self.secpickereview2.tag = 2
                            
                            self.tkont1.inputView = self.secpickereview1
                            self.tkont2.inputView = self.secpickereview2
                            
                            self.doneButton()
                            
                            view.stopAnimating()
                            
                            
                        }
                        catch
                        {
                            
                            print("Hata oluştu")
                            
                        }
                    }
                });
            });
            /**/
            
        })
        task.resume()
        
        return NSString(string: "OK")
    }

}

