admin = Admin.create!(email: "admin@paganza.com", password: "paganza123")
example_input_path = File.expand_path("../spec/resources/example_input.tab", __dir__)
TransactionImporter.new(example_input_path, admin).import
