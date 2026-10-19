
import Foundation

class Student: Identifiable {
    var id: String
    var name: String
    var age: Int

    init(id: String, name: String, age: Int) {
        self.id = id
        self.name = name
        self.age = age
    }

    func displayInfo() -> String {
        return "\(id) - \(name), Age: \(age)"
    }
}

class Subject: Identifiable {
    var id: String
    var name: String
    var credits: Int

    init(id: String, name: String, credits: Int) {
        self.id = id
        self.name = name
        self.credits = credits
    }
}

class StudentRecord: Identifiable {
    var id = UUID()
    var student: Student
    var subject: Subject
    private var _mark: Double
    var mark: Double {
        get { _mark }
        set {
            if (0.0...100.0).contains(newValue) {
                _mark = newValue
            }
        }
    }
    
    init(student: Student, subject: Subject, mark: Double) {
        self.student = student
        self.subject = subject
        self._mark = min(100.0, max(0.0, mark))
    }
    
    func isPassed() -> Bool {
        return mark >= 50.0
    }
}

