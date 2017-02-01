require_relative("./models/student")
require_relative("./models/house")
require_relative("./db/sqlrunner")
require 'pry-byebug'


@house_1 = House.new({'house_name' => 'Gryffindor', 'logo_url' => 'null' })
@house_2 = House.new({'house_name' => 'Hufflepuff', 'logo_url' => 'null' })
@house_3 = House.new({'house_name' => 'Ravenclaw', 'logo_url' => 'null' })
@house_4 = House.new({'house_name' => 'Slytherin', 'logo_url' => 'null' })

@house_1.save
@house_2.save
@house_3.save
@house_4.save

@student_1 = Student.new({'first_name' => 'Harry', 'second_name' => 'Potter', 'house' => 1, 'age' => 12} )


@student_1.save

binding.pry 
nil