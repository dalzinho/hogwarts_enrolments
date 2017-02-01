class House


  def initialize (options)
    @house_id = options["house_id"].to_i
    @house_name = options["house_name"]
    @logo_url = options["logo_url"]
  end

  def save()
    sql = "INSERT INTO houses (house_name, logo_url) VALUES ('#{@house_name}', '#{@logo_url}') RETURNING *;"
    result = SqlRunner.run(sql).first
    @house_id = result["house_id"].to_i
  end

  def self.get_all
    sql = "SELECT * FROM houses;"
    result = SqlRunner.run(sql)
    return result.map {|house| House.new(house)}
  end

  def self.find_by_id(search_id)
    sql = "SELECT * FROM houses WHERE house_id = #{search_id};"
    result = SqlRunner.run(sql).first
    return House.new(result)
  end


end
