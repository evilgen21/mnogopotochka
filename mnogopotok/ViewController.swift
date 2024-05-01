import UIKit

class ViewController: UIViewController {
    var count = 0
    let dispatchQueue = DispatchQueue(label: "com.4433.queue")
    let dispatchQueue1 = DispatchQueue(label: "com.4455.queue")
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button1: UIButton!
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        label.text = "задача 1"
        label2.text = "задача 2"
        
        dispatchQueue.async {
            for i in 1...25 {
                DispatchQueue.main.async {
                    self.label.text = "\(i)"
                }
                if i == 10 {
                    self.dispatchQueue.suspend()
                    self.startSecondTask()
                }
                Thread.sleep(forTimeInterval: 0.5)
            }
            DispatchQueue.main.async {
                          self.label.text = "Задача 1 выполнена"
                      }
        }
        
    }
    
    @IBAction func buttonPressed2(_ sender: UIButton) {
        var counter = 0
            var counter2 = 0
                let queue = DispatchQueue(label: "com.332.myqueue")
                let queue2 = DispatchQueue(label: "com.4443.myqueue2")
                let semaphore = DispatchSemaphore(value: 0)
        
        label.text = "задача 1"
        label2.text = "задача 2"

                queue.async {
                    for i in 1...30 {
                        DispatchQueue.main.sync {
                            self.label.text = "\(i)"
                        }
                        if i == 10 {
                            queue2.async {
                                for j in 1...5 {
                                    DispatchQueue.main.sync {
                                        self.label2.text = "\(j) миссисипи"
                                        self.label.text = "задача 1 на паузе \(5-j)"
                                    }
                                    Thread.sleep(forTimeInterval: 1.0)
                                }
                                DispatchQueue.main.async {
                                              self.label2.text = "Задача 2 выполнена"
                                }
                              semaphore.signal()
                            }
                            semaphore.wait()
                        }
                        Thread.sleep(forTimeInterval: 0.5)
                    }
                
                }
            }
        
    
    
    func startSecondTask() {
        dispatchQueue1.async {
            for i in 1...5 {
                DispatchQueue.main.async {
                    self.label2.text = "\(i) миссисипи"
                }
                Thread.sleep(forTimeInterval: 1)
            }
            DispatchQueue.main.async {
                self.label2.text = "задача 2 выполнена"
            }
        }
    }
    
    
    
    }

