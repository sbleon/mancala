require 'mancala'

step 'I am not playing a game yet' do
end

step 'I start a game' do
  @game = Mancala::Game.start(output)
end

step 'I see a game board' do
  board =<<-'EOF'
                                        <-- Player 1
        +---------+----6----+----5----+----4----+----3----+----2----+----1----+---------+
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
        +---------+----1----+----2----+----3----+----4----+----5----+----6----+---------+
                                            Player 2 -->
  EOF
  output.messages.join("\n").should include board
end
