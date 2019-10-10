class Assumption::CLI

  include UniFunctions

  attr_accessor :input
  
  def start_sequence
    clear_terminal
    title
    self.begin
  end
  
  def begin
    puts 'Type the chart year you would like to play between 1954-2019'
    
    year_input

    puts 'Would you like to play again? (y/n)'
    get_char
    @input == 'y' ? start_sequence : exit
  end

  private

  def year_input
    @input = gets
    #binding.pry
    if (1954..2019).include?(@input.to_i)
      Assumption::Game.new(@input.to_i)
    elsif @input.strip == "random"
      Assumption::Game.new(random_year)
    elsif @input.strip.to_s.size != 4
      puts 'Must be 4 digits' 
      year_input
    elsif !(1954..2019).include?(@input.to_i)
      puts 'Must be within 1954-2019'
      year_input
    else
       puts 'Error'
       exit
    end
  end

  def random_year
    rand(1954..2019)
  end

end