//
//  TipSecViewDetay.swift
//  BaranKS
//
//  Created by Baran Ambalaj A.Ş. on 11.10.2017.
//  Copyright © 2017 Baran Ambalaj A.Ş. All rights reserved.
//  AYLIK DETAY

import UIKit
import AEXML
import Alamofire
import NVActivityIndicatorView


class TipSecViewDetay1: UIViewController, UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate, NSURLConnectionDelegate, XMLParserDelegate, NVActivityIndicatorViewable {
    
    
   // var ilkgelenpar:String?
   // @IBOutlet weak var gelenpar1: UILabel!   
   
    @IBOutlet weak var btnkaydet: UIButton!
        @IBOutlet weak var topobjebaslik: UINavigationItem!
    var stexts = [String]()
    
    
    @IBOutlet weak var myTableView1: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let navigationAp = UINavigationBar.appearance()
        navigationAp.tintColor = UIColor(red: 49/255, green: 74/255, blue: 138/255, alpha: 1.0)
        navigationAp.barTintColor = UIColor.white
        navigationAp.titleTextAttributes = [NSAttributedStringKey.foregroundColor:UIColor(red: 49/255, green: 74/255, blue: 138/255, alpha: 1.0)]
        
        topobjebaslik.title=MyClass.bolumadi1 + " - " + MyClass.bolumadi2
        
        
        btnkaydet.backgroundColor = UIColor(red: 49/255, green: 74/255, blue: 138/255, alpha: 1.0)
        btnkaydet.setTitleColor(UIColor.white, for: .normal)
        
       print("Detay1")
        if actions(veri: "WGSM#"+MyClass.bolumadi1kod) == "OK"
        {
        }
        
   
        //  myTableView1.setContentOffset(myTableView1.contentOffset, animated: false)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
             
        
    }
 
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if (indexPath.row % 2) == 0
        {
            cell.contentView.backgroundColor = UIColor(red:204/255, green:224/255, blue:255/255, alpha: 1.0)
        }
        else
        {
            // cell.contentView.backgroundColor = UIColor(red:51/255, green:133/255, blue:255/255, alpha: 1.0)
        }
        
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stexts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell1", for: indexPath) as! TipSecViewCell1
        cell.Stextpar.text = stexts[indexPath.row]
        
        return cell
    }
    
    
  
    
    
    
    
 
    
    func actions (veri:String) -> NSString
    {
        
        let parcalama = veri.components(separatedBy: "#")
        let parca1    = parcalama[0]
        //let parca2 = parcalama[1]
        
        let view = NVActivityIndicatorView(frame: CGRect(x: 350, y: 450, width: 150, height: 150))
        view.color = UIColor.red
        view.type = .ballClipRotate
        view.padding = 0
        view.startAnimating()
        self.view.addSubview(view)
        
        
        let celcius = veri
        var is_SoapMessage: String = "<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:cgs=\"http://tempuri.org/\"><soapenv:Header/><soapenv:Body><cgs:performansayliklist><cgs:xparametre>\(celcius)</cgs:xparametre></cgs:performansayliklist></soapenv:Body></soapenv:Envelope>"
        
        var theRequest = URLRequest(url: URL(string: "http://onay.baranambalaj.com.tr/ipad.asmx")!)
        
        let session = URLSession.shared
        
        theRequest.httpMethod = "POST"
        theRequest.httpBody = is_SoapMessage.data(using: String.Encoding.utf8)
        theRequest.addValue("onay.baranambalaj.com.tr", forHTTPHeaderField: "Host")
        theRequest.addValue("text/xml; charset=utf-8", forHTTPHeaderField: "Content-Type")
        theRequest.addValue(String(is_SoapMessage.characters.count), forHTTPHeaderField: "Content-Length")
        theRequest.addValue("http://tempuri.org/performansayliklist", forHTTPHeaderField: "SOAPAction")
        
        
        let task = session.dataTask(with: theRequest, completionHandler: {data, response, error -> Void in
            let strData = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            //print("Body: \(String(describing: strData))")
            
            /*oku*/
            DispatchQueue.global(priority: DispatchQueue.GlobalQueuePriority.default).async(execute: {
                DispatchQueue.main.async(execute: {
                    Alamofire.request("http://onay.baranambalaj.com.tr/XMLFILE/"+parca1+"performansayliklist.xml").response { response in
                        guard let xmlData = response.data else {return}
                        let options = AEXMLOptions()
                        do
                        {
                            
                            let xmlDoc = try AEXMLDocument(xml: xmlData, options: options)
                            //print(xmlDoc.root["Table"]["STEXT"].value!)
                            if let items = xmlDoc.root["Table"].all{
                                
                                for item in items{
                                    self.stexts.append(item["STEXT"].string)
                                  //  self.krtids.append(item["KRTID"].string)
                                  //  self.puans.append(item["PUAN"].string)
                                }
                            }
                            
                            
                          
                            self.myTableView1.reloadData()
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
