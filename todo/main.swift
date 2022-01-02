//
//  main.swift
//  todo
//
//  Created by Fay Anas Alshiban on 19/05/1443 AH.
//


import Foundation

class Task{
    var taskName: String = ""
    var  Checked : Bool
    init(taskName:String , Checked:Bool ){
        self.taskName=taskName
        self.Checked=Checked
    }
    func getTaskName() -> String{
        return self.taskName
        
    }
    func setTaskName(taskName:String) {
      self.taskName = taskName
        
    }
    func taskformat() -> String{
        return taskName
    }
    
    func getChecked() -> Bool {
          return self.Checked
      }
      func setChecked(Checked:Bool)  {
          self.Checked = Checked
      }
    
    func isChecked() {
        self.Checked = true
    }
    func notChecked(){
        self.Checked = false
        
    }
    func formattedStringOfTask()-> String{
          var chStatus : String?
          if Checked == true {
              chStatus  = "☑️"
          }else{
              chStatus  = "⭕"
          }
          return """
                  Your task is : \(taskName) ,  \(chStatus!)
                  """
      }
  }


print("""
      Welcome to your ToDo list
       I hope you are ready today to climb your goals!  🧗🏼
      
      Go ahead and see the Menu!
      """ )
print("Menu")
print("""

 | 1.Write your list ✏️    |
 | 2.Check your task ✔️    |
 | 3.Reveiw your list  🗒  |
 | 4.Edit your task    📝  |
 | 5.Delet your task ❌    |
 | 6.Exit 🚫               |

""")

var userChoice : Int
var inputArray: Array<Task> = []
print("\n Write your choice \n ")
if let input1 = Int(readLine()!){
    
    userChoice=input1
//switch
    repeat{

        switch userChoice{
        case 1 :
            writeTask()
            print("\nBack to Menu, Write your choice \n")
            var input3 = Int(readLine()!)
            userChoice = input3!
        case 2 :
            ischeck()
            print("\nBack to Menu, Write your choice \n")
            var input99 = Int(readLine()!)
            userChoice = input99!
        case 3 :
            print("---------------------------------")
            date()
               
               if(inputArray.count > 0){
                   for (index, task) in inputArray.enumerated() {
                       print("\(index+1)- \(task.formattedStringOfTask())")
                   }
               }else{
                   print("Your list is empty!")
               }
               print("---------------------------------")
               
        
            print("\nBack to Menu, Write your choice \n")
            var input4 = Int(readLine()!)
            userChoice = input4!
        case 4 :
            UpdateTask()
            print("\n Back to Menu, Write your choice \n")
            var input80 = Int(readLine()!)
            userChoice = input80!
            break
        case 5 :
            DeleteTask()
            print("\n Back to Menu, Write your choice \n")
            var input5 = Int(readLine()!)
            userChoice = input5!
            break
        case 6:
            print("")
        default : print("nothing")
            
        }
    }while (userChoice != 6)
}




//write the task
func writeTask(){
    
    print("Hello write your tasks ✍🏻  for today or 0 to quit:  \n")
    while let input = readLine() {
        
        guard input != "0" else {
            break
        }
      
           
        inputArray.append(Task(taskName: input , Checked: false))
          
        
        
        print("Enter a task ✍🏻 :")
    }
    // get the current date and time
date()

   
    if(inputArray.count > 0){
        for (index, task) in inputArray.enumerated() {
            print("\(index+1)- \(task.formattedStringOfTask())")
        }
    }else{
        print("Your list is empty!")
    }

        
    }

//check the task()

func DeleteTask(){
    print("write the task you want to Delte")
     var task :Int
    if (inputArray.count == 0){
        print("There's no task")
         

}
     if let userInput = readLine() {
        task = Int(userInput)!
        let task = inputArray.index(before: task)
            inputArray.remove(at : task)
            
        }
  
}





//date
func date(){
    let currentDateTime = Date()
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MMM dd, yyyy"
    let todaysDate = dateFormatter.string(from: currentDateTime)
    print("Your tasks for ", todaysDate , "is : \n")
}


//to Check the Task
func ischeck(){
    

      
              var taskIndex :Int
        if(inputArray.count == 0){
                  print("Your list is Empty :p !")
              }else{
                  print("\n Enter the task number that you wanted to check  🥳 :")
                  if let userInput = readLine() {
                      taskIndex = Int(userInput)!
                      let task = inputArray.index(before: taskIndex)
                      for (index, item ) in inputArray.enumerated() {
                          if index == task {
                              item.isChecked()
                              print("Your To-do task Done ✔️")
                          }
                      }
                  }else{
                      print("Please check out the number and enter it right")
                  }
                  
              }
              
          }
          
        
//to update the Task
 func UpdateTask(){
     var tIndex :Int
     var newTaskName :String
     if(inputArray.count == 0){
         print("Your list is Empty :p!")
     }else{
         print("\n Enter the number of task that you want to update :")
         if let userInput = readLine() {
             tIndex = Int(userInput)!
             let task = inputArray.index(before: tIndex)
             for (index, item ) in inputArray.enumerated() {
                 if index == task {
                    print("Enter your the new task :")
                         if let userInput = readLine() {
                             newTaskName = userInput
                             item.setTaskName(taskName: newTaskName)
                             print("Your To-do task updated Successfully")
                         }
                     }
                     
                 }
         
         }else{
             print("Please check out the number and enter it right")
         }
         
     }
 }
