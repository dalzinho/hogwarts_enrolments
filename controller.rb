require ('sinatra')
require ('sinatra/contrib/all')
require_relative ('models/house')
require_relative ('models/student')
require_relative ('db/sqlrunner')


get '/students' do
  @students = Student.get_all
  erb (:index)
end

get '/students/new' do
  erb (:new)
end

post '/students' do
  @student = Student.new(params)
  @student.save
  erb (:create)
  end