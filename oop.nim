type
  Person = ref object of RootObj
    name*: string
    age: int

  Student = ref object of Person
    id: int


var
  student: Student
  person: Person
assert(student of Student) #is true

student = Student(name: "Reik", age: 52, id: 2)
echo student[]
echo student.name
echo student.id
