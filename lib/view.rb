class View
  # def ask_user_for_importation
  #   puts "Do you want to importe your csv input?"
  #   gets.chomp
  # end

  def display(usersbook)
    usersbook.each_with_index do |list, index|
      puts "#{index + 1} - #{list.first_name}, #{list.last_name}, #{list.scope_id}, #{list.email}"
    end
  end
end
