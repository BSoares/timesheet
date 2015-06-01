unless User.all.any?
  User.create(name: "Bruno", email: "bruno@bsoares.com.br", password: "123456")
end

unless Employee.all.any?
  [
    ["406.313.167-01", "Omega Keitt"],
    ["584.787.716-11", "Kathlene Bachus"],
    ["737.051.171-57", "Donetta Habel"],
    ["965.175.657-87", "Eloy Gurney"],
    ["015.829.956-64", "Jodi Yonts"],
    ["866.625.630-30", "Romona Elms"],
    ["460.666.628-56", "Gavin Vicario"],
    ["726.453.460-06", "Milagros Lineman"],
    ["741.574.363-69", "Latonya Bosio"],
    ["983.289.373-95", "Brigida Gillespie"],
    ["887.338.232-00", "Hae Ackman"],
    ["629.213.442-38", "Kandace Silver"],
    ["558.864.256-24", "Juliann Haberle"],
    ["943.054.834-40", "Gerda Clerk"],
    ["835.329.234-32", "Brant Skelley"]
  ].each do |employee_data|
    employee = Employee.create(cpf: employee_data[0], name: employee_data[1])
    Attendance.create(
      employee: employee, day: Date.new(2015, 5, 19),
      entrance_at: DateTime.new(2015, 5, 19, 8, 0, 0),
      departure_at: DateTime.new(2015, 5, 19, 17, 0, 0))
    Attendance.create(
      employee: employee, day: Date.new(2015, 5, 20),
      entrance_at: DateTime.new(2015, 5, 20, 8, 1, 0))
    Attendance.create(
      employee: employee, day: Date.new(2015, 5, 21),
      entrance_at: DateTime.new(2015, 5, 21, 8, 1, 0),
      departure_at: DateTime.new(2015, 5, 21, 14, 0, 0))
    Attendance.create(
      employee: employee, day: Date.new(2015, 5, 22),
      entrance_at: DateTime.new(2015, 5, 22, 8, 1, 0),
      departure_at: DateTime.new(2015, 5, 22, 22, 0, 0))
    Attendance.create(
      employee: employee, day: Date.new(2015, 5, 23),
      entrance_at: DateTime.new(2015, 5, 23, 8, 1, 0),
      departure_at: DateTime.new(2015, 5, 23, 8, 2, 0))
    Attendance.create(
      employee: employee, day: Date.new(2015, 5, 24),
      entrance_at: DateTime.new(2015, 5, 24, 10, 30, 0),
      departure_at: DateTime.new(2015, 5, 24, 12, 58, 0))
    Attendance.create(
      employee: employee, day: Date.new(2015, 5, 25),
      entrance_at: DateTime.new(2015, 5, 25, 12, 33, 0))
    Attendance.create(
      employee: employee, day: Date.new(2015, 5, 26),
      entrance_at: DateTime.new(2015, 5, 26, 8, 29, 3),
      departure_at: DateTime.new(2015, 5, 26, 22, 32, 18))
    Attendance.create(
      employee: employee, day: Date.new(2015, 5, 27),
      entrance_at: DateTime.new(2015, 5, 27, 6, 15, 38),
      departure_at: DateTime.new(2015, 5, 27, 23, 59, 59))
  end
end
