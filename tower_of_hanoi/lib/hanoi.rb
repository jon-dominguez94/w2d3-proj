class Hanoi
  def initialize
    @disc = [[3,2,1],[],[]]
  end

  def play
    display

    until won?
      puts 'What tower do you want to move from?'
      from_tower = gets.to_i

      puts 'What tower do you want to move to?'
      to_tower = gets.to_i

      if valid_move?(from_tower, to_tower)
        move(from_tower, to_tower)
        display
      else
        display
        puts "Invalid move. Try again."
      end
    end

    puts 'You win!'
  end

  def won?
    @disc[0].empty? && @disc[1..2].any?(&:empty?)
  end

  def valid_move?(from_tower, to_tower)
    return false unless [from_tower, to_tower].all? { |i| i.between?(0, 2) }

    !@disc[from_tower].empty? && (
      @disc[to_tower].empty? ||
      @disc[to_tower].last > @disc[from_tower].last
    )
  end

  def move(from_tower, to_tower)
    raise "cannot move from empty stack" if @disc[from_tower].empty?
    raise "cannot move onto smaller disk" unless valid_move?(from_tower, to_tower)
    @disc[to_tower] << @disc[from_tower].pop
  end

  def render
    'Tower 0:  ' + @disc[0].join('  ') + "\n" +
      'Tower 1:  ' + @disc[1].join('  ') + "\n" +
      'Tower 2:  ' + @disc[2].join('  ') + "\n"
  end

  def display
    # this moves everything up in the console so that whatever we print
    # afterwards appears at the top
    system('clear')
    puts render
  end

  # private

  attr_reader :disc

end

if $PROGRAM_NAME == __FILE__
  Hanoi.new.play
end
