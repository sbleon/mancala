require 'mancala'

step 'I am not playing a game yet' do
end

step 'I start a game' do
  @output = Output.new
  @game = Mancala::Game.start(@output)
end

step 'I see a game board' do
  board =<<-EOF
    +---------+---------+---------+---------+---------+---------+---------+---------+
    |/       \|/       \|/       \|/       \|/       \|/       \|/       \|/       \|
    |         |    o    |    o    |    o    |    o    |    o    |    o    |         |
    |         |    o    |    o    |    o    |    o    |    o    |    o    |         |
    |         |    o    |    o    |    o    |    o    |    o    |    o    |         |
    |         |    o    |    o    |    o    |    o    |    o    |    o    |         |
    |         |\       /|\       /|\       /|\       /|\       /|\       /|         |
    |         +---------+---------+---------+---------+---------+---------+         +
    |         |/       \|/       \|/       \|/       \|/       \|/       \|         |
    |         |    o    |    o    |    o    |    o    |    o    |    o    |         |
    |         |    o    |    o    |    o    |    o    |    o    |    o    |         |
    |         |    o    |    o    |    o    |    o    |    o    |    o    |         |
    |         |    o    |    o    |    o    |    o    |    o    |    o    |         |
    |\       /|\       /|\       /|\       /|\       /|\       /|\       /|\       /|
    +---------+---------+---------+---------+---------+---------+---------+---------+
  EOF
  @output.messages.join("\n").should =~ Regexp.new(board)
end


class Output
  def messages
    @messages ||= []
  end

  def puts(message)
    messages << message
  end
end
