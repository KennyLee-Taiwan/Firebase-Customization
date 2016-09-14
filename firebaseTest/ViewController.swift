//
//  ViewController.swift
//  firebaseTest
//
//  Created by Daphne Jiang on 9/12/16.
//  Copyright © 2016 Kenny Lee. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var importedMessages: UITextField!

    @IBOutlet weak var sentMessage: UITextField!


    
    @IBAction func sendTapped(_ sender: AnyObject) {
        
        sendMessage()
        
    }
    

    
    @IBAction func eraseTapped(_ sender: AnyObject) {
        
        let myRootRef = FIRDatabase.database().reference()
        
        //  Write data to Firebase
        myRootRef.setValue("")
        
    }

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    
        
    }
    
    func sendMessage() {
        
        
        //  Create a reference to a Firebase location
        let myRootRef = FIRDatabase.database().reference()
        
        
        // Generate an unique ID
        let myRootRef1 = myRootRef.childByAutoId()
        
        //  Write data to Firebase
        myRootRef1.setValue(sentMessage.text)
        
        //  Read data and react to changes
        myRootRef.observe(.childAdded, with: {
            snapshot in
            
            if let value = snapshot.value {
                
                self.importedMessages.text = value as! String
                
            }
  
    
            //print("\(snapshot.key) -> \(snapshot.value)")
        })
        
        
        
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

