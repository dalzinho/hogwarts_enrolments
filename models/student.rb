class Student

  attr_reader :student_id, :first_name, :second_name, :house, :age

  def initialize (options)
    @student_id = options["student_id"].to_i
    @first_name = options["first_name"]
    @second_name = options["second_name"]
    @house = options["house"]
    @age = options["age"].to_i

  end


  def save()
    sql = "INSERT INTO students (first_name, second_name, house, age) VALUES ('#{@first_name}', '#{@second_name}', '#{@house}', #{@age}) RETURNING *;"
    result = SqlRunner.run(sql).first
    @student_id = result["student_id"].to_i
  end

  def self.get_all
    sql = "SELECT * FROM students;"
    result = SqlRunner.run(sql)
    return result.map {|student| Student.new(student)}
  end

  def self.find_by_id(search_id)
    sql = "SELECT * FROM students WHERE student_id = #{search_id};"
    result = SqlRunner.run(sql).first
    return Student.new(result)
  end


end