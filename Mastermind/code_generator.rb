class Code
  def initialize(mode,player_phrase)
    puts "mode: #{mode}."
    puts "player code #{player_phrase}."
    if (mode == "1")
      @code = generate_code
    else
      tmp = player_phrase.upcase.split("")
      @code = []
      tmp.each{|val| @code.push(val)}
    end
  end

  private

  def generate_code
    code = []
    color_list = %w[R G B Y]
    # R = Red, G = Green, B = Blue, Y = Yellow
    for i in 1..4 do 
      code.push(color_list[rand(color_list.length)])
    end
    code
  end

  public

  # @param player_guess_string[String]
  def check_code(player_guess_string)
    
    player_code_guess = player_guess_string.upcase.split('')

    # 𐄂✅✔
    feedback = []

    temp_code = @code.clone
    index_to_remove = []

    for i in 0..(player_code_guess.length - 1) do
      if player_code_guess[i] == temp_code[i]
        feedback.push('✔')
        index_to_remove.push(i)
      end
    end

    until index_to_remove.empty?
      index = index_to_remove.pop
      temp_code.delete_at(index)
      player_code_guess.delete_at(index)
    end

    player_code_guess.each_index do |val|
      if temp_code.any?(player_code_guess[val])
        index_to_remove.push(val)
        feedback.push('✅')
      end
    end

    player_code_guess.delete_at(index_to_remove.pop) until index_to_remove.empty?

    for i in (0..player_code_guess.length - 1) do
      feedback.push("X")    
    end

    feedback
  end

  def answer_is
    return @code
  end

end