require 'csv'
require_relative "list.rb"

class Usersbook
  attr_reader :lists

  def initialize(cvs_input_file_path)
    @cvs_input_file_path = cvs_input_file_path
    @lists = []
    @csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }
    i = 0
    CSV.foreach(@cvs_input_file_path, @csv_options) do |row|
      email = "#{row['email']}".downcase
      first_name = email.split('.')[0].capitalize
      last_name = email.split('.')[1].split('@')[0].capitalize
      scope_id =  i
      i += 1
      @lists << List.new(first_name, last_name, scope_id, email)
    end
  end

  def all
    @lists
  end

  def export
    csv_options_output = { col_sep: ',', force_quotes: true, quote_char: '"' }
    csv_file = File.join(__dir__, 'output.csv')
    CSV.open(csv_file, 'wb', csv_options_output) do |csv|
      @lists.each do |list|
        csv << [list.first_name, list.last_name, list.scope_id, list.email]
      end
    end
  end
end
