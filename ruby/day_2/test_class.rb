#!/usr/bin/ruby -w

class Student
  def initialize(name, grade)
    @name = name
    @grade = grade
    @classroom = random_classroom
  end

  def random_classroom
    ['12A', '15B', '16C', '18A'].sample
  end

  def ppp
    puts @name
  end

end

student = Student.new("Dummy Name","B")

puts student.ppp

