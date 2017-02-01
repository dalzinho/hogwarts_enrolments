require_relative("./models/student")
require_relative("./models/house")
require_relative("./db/sqlrunner")
require 'pry-byebug'


@student_1 = Student.new({'first_name' => 'Harry', 'second_name' => 'Potter', 'house' => 1, 'age' => 12} )

@student_1.save

@house_1 = House.new({'house_name' => 'Gryffindor', 'logo_url' => 'null' })

@house_1.save

binding.pry 
nil