//
//  ViewController.swift
//  Data Persistence
//
//  Created by juan.luis.lopez.munoz@philips.com on 08/02/2018.
//  Copyright © 2018 philips. All rights reserved.
//

import UIKit
import SQLite3

struct UserDefaultsKeys {
    static let boolKey = "Key1"
    static let intKey = "Key2"
    static let objectKey = "Key3"
    static let arrayKey = "Key4"
}

class ViewController: UIViewController {

    let userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: User Defaults
    @IBAction func addDataToUserDefaults() {
        userDefaults.set(true, forKey: UserDefaultsKeys.boolKey)
        userDefaults.set(123, forKey: UserDefaultsKeys.intKey)
        userDefaults.set("Some Object", forKey: UserDefaultsKeys.objectKey)
        userDefaults.set([1, 2, 3, 4], forKey: UserDefaultsKeys.arrayKey)
        
        userDefaults.synchronize()
    }
    
    @IBAction func readDataFromUserDefaults() {
        let myBool = userDefaults.bool(forKey: UserDefaultsKeys.boolKey)
        let myInt = userDefaults.integer(forKey: UserDefaultsKeys.intKey)
        let myObject = userDefaults.object(forKey: UserDefaultsKeys.objectKey)
        let myArray = userDefaults.object(forKey: UserDefaultsKeys.arrayKey)
        
        print("\(myBool), \(myInt), \(String(describing: myObject)), \(String(describing: myArray))")
    }
    
    // MARK: File system
    func saveFile() {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        let textFile = "textFile.txt"
        let fileURL = documentsDirectory.appendingPathComponent(textFile)
        let content = "Hello World"
        do{
            try content.write(to: fileURL, atomically: false, encoding: String.Encoding.utf8)
        }catch _ {
        }
    }
    
    func loadFile() -> String {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        let textFile = "textFile.txt"
        let fileURL = documentsDirectory.appendingPathComponent(textFile)
        let content: String
        do{
            content = try String.init(contentsOf: fileURL, encoding: .utf8)
        } catch _{
            content=""
        }
        return content;
    }
    
    // MARK: SQLite
    func openDataBase() {
        let db: SQLiteDatabase
        do {
            db = try SQLiteDatabase.open(path: "my database path")
        } catch SQLiteError.OpenDatabase(let message){
            print(message)
        } catch {
            
        }
    }
}

