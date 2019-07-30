require 'csv'

# Reading input csv
csv_options_input = { col_sep: ',', quote_char: '"', headers: :first_row }
filepath = 'input.csv'
users = []
user = Hash.new

i = 0
CSV.foreach(filepath, csv_options_input) do |row|
  email = "#{row['email']}".downcase
  user['first_name'] = email.split('.')[0].capitalize
  user['last_name'] = email.split('.')[1].split('@')[0].capitalize
  user['scope_id'] =  i
  user['email'] =  email
  i += 1
  users << user
  user = {}
end

# Writing output csv
csv_options_output = { col_sep: ',', force_quotes: true, quote_char: '"' }
filepath = 'output.csv'

j = 0
CSV.open(filepath, 'wb', csv_options_output) do |csv|
  csv << %w[first_name last_name scope_id email]
  i.times do
    csv << users[j].values
    j += 1
  end
end
