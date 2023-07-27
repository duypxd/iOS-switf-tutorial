//
//  TodoList.swift
//  swiftios
//
//  Created by Duy Pham on 27/07/2023.
//

import Foundation
import SwiftUI

struct EmployeeModel: Identifiable {
    let id: Int
    let name: String
}

enum AlertType: Identifiable {
    case DeleteEmployee
    case EmployeeExits
    
    var id: Int { // Provide an id for each case
        switch self {
        case .DeleteEmployee: return 0
        case .EmployeeExits: return 1
        }
    }
}


struct TodoListView: View {
    @State var employees: [EmployeeModel] = [
        EmployeeModel(id: 1, name: "Duy Pham"),
        EmployeeModel(id: 2, name: "Thuan Cao")
    ]
    @State var _employeeName = ""
    @State var alertType: AlertType?
    @State var employeeToDelete: EmployeeModel?
    
    func addNewEmployee() {
        if(!_employeeName.isEmpty) {
            let isExitEmployee = employees.contains { $0.name == _employeeName }
            if(!isExitEmployee) {
                employees.append(EmployeeModel(
                    id: employees.count + 1,
                    name: _employeeName
                ))
                _employeeName = ""
            } else {
                alertType = .EmployeeExits
            }
        }
    }
    
    func deleteEmployee() {
        employees.removeAll{ $0.id == employeeToDelete?.id}
        self.employeeToDelete = nil
    }
    
    var body: some View {
        VStack {
            List(employees) {
                employee in
                HStack {
                    Text("\(employee.id): ")
                    Text(employee.name)
                    Spacer()
                    Button(action: {
                        employeeToDelete = employee
                        alertType = .DeleteEmployee
                    }) {
                        Image(systemName: "trash").foregroundColor(.red)
                    }
                    .frame(height: 24.0)
                    .frame(height: 24.0)
                }
            }.background(Color.white).listStyle(PlainListStyle())
            
            TextField("Enter a new employee", text: $_employeeName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(0).onChange(of: _employeeName) {
                    newValue in
                    _employeeName = newValue
                }
            
            Button("Thêm mới", action: addNewEmployee)
        }.alert(item: $alertType) {
            alertType in
            switch alertType {
            case .DeleteEmployee:
                return Alert(
                    title: Text("Confirm Delete"),
                    message: Text("Are you sure you want to delete \(employeeToDelete?.name ?? "")?"),
                    primaryButton: .default(Text("Delete"), action: deleteEmployee),
                    secondaryButton: .cancel(Text("Cancel"))
                )
            case .EmployeeExits:
                return Alert(
                    title: Text("Error"),
                    message: Text("Employee already exists"),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
    }
}
