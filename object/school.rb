class School
  attr_accessor :name, :address
  def initialize(name,address)
    @name = name
    @address = address
  end
end

school = School.new("A school","Shibuya")
puts(school.instance_variables)
