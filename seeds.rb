require_relative("./models/student")
require_relative("./db/sqlrunner")
require 'pry-byebug'


@student_1 = Student.new({'first_name' => 'Harry', 'second_name' => 'Potter', 'house' => 'Gryffindor', 'age' => 12} )

@student_1.save


binding.pry 
nil