import 'dart:async';

import 'employee.dart';

class EmployeeBloc {
  
  List<Employee> _employeeList = [
    Employee(1,"Ramesh",15000.0),
    Employee(2,"Suresh",25000.0),
    Employee(3,"Michael",30000.0),
    Employee(4,"Mary",23000.0),
    Employee(5,"Tarun",40000.0),
    
  ]; 

  final _employeeListStreamController = StreamController<List<Employee>>();

  //for inc and dec

  final _employeeSalaryIncrementStreamController = StreamController<Employee>();

  final _employeeSalaryDecrementStreamController = StreamController<Employee>();


Stream<List<Employee>> get employeeListStream =>
_employeeListStreamController.stream;


StreamSink<List<Employee>> get employeeListSink =>
_employeeListStreamController.sink;

StreamSink<Employee> get employeeSalaryIncrement => 
_employeeSalaryIncrementStreamController.sink;

StreamSink<Employee> get employeeSalaryDecrement => 
_employeeSalaryDecrementStreamController.sink;




EmployeeBloc(){
  _employeeListStreamController.add(_employeeList);
  _employeeSalaryIncrementStreamController.stream.listen(_incrementSalary);
  _employeeSalaryDecrementStreamController.stream.listen(_decrementSalary);

}

_incrementSalary(Employee employee){
  double salary = employee.salary;

  double incrementedSalary = salary * 20/100;

  _employeeList[employee.id - 1 ].salary = salary + incrementedSalary;

  employeeListSink.add(_employeeList);


}



_decrementSalary(Employee employee){
  double salary = employee.salary;

  if(salary > 0.01 ){
    
  double decrementedSalary = salary * 20/100;

  _employeeList[employee.id - 1 ].salary = salary - decrementedSalary;

  employeeListSink.add(_employeeList);

  }

}


void dispose(){
 _employeeListStreamController.close();
 _employeeSalaryIncrementStreamController.close(); 
 _employeeSalaryDecrementStreamController.close(); 

}

}


