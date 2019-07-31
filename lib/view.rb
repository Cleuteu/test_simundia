class View
  def done_export
    puts "Done! Your csv file is here : #{File.join(__dir__, 'output.csv')}"
  end

  def display(usersbook)
    usersbook.each_with_index do |list, index|
      puts "#{index + 1} - #{list.first_name}, #{list.last_name}, #{list.scope_id}, #{list.email}"
    end
  end
end
