class Student

  attr_reader :student_id, :first_name, :second_name, :house, :age

  def initialize (options)
    @student_id = options["student_id"].to_i
    @first_name = options["first_name"]
    @second_name = options["second_name"]
    @house = options["house"].to_i
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

  def get_house()
    sql = "SELECT houses.house_name FROM houses INNER JOIN students ON students.house = houses.house_id WHERE students.student_id = #{@student_id};"
    return SqlRunner.run(sql).first

    # sql = "SELECT h.house_name FROM houses h INNER JOIN students s ON h.house_id = s.house;"
  end


end