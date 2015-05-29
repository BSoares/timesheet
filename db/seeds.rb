unless User.all.any?
  User.create(name: "Bruno", email: "bruno@bsoares.com.br", password: "123456")
end
