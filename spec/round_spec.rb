require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require 'pry'

RSpec.describe Round do
  it 'exists' do
    card_1 = Card.new("What is the capital of Alaska?",
                      "Juneau",
                      :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?",
                      "Mars",
                      :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?",
                      "North north west",
                      :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    expect(round).to be_instance_of(Round)
  end

  it 'has a deck' do
    card_1 = Card.new("What is the capital of Alaska?",
                      "Juneau",
                      :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?",
                      "Mars",
                      :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?",
                      "North north west",
                      :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    expect(round.deck).to be_instance_of(Deck)
  end

  it 'has turns' do
    card_1 = Card.new("What is the capital of Alaska?",
                      "Juneau",
                      :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?",
                      "Mars",
                      :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?",
                      "North north west",
                      :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    # binding.pry

    expect(round.turns).to eq([])
  end

  it 'has current card' do
    card_1 = Card.new("What is the capital of Alaska?",
                      "Juneau",
                      :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?",
                      "Mars",
                      :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?",
                      "North north west",
                      :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    # binding.pry
    expect(round.current_card).to eq(card_1)
  end

  it 'takes a turn' do
    card_1 = Card.new("What is the capital of Alaska?",
                      "Juneau",
                      :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?",
                      "Mars",
                      :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?",
                      "North north west",
                      :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    round.take_turn("Juneau")
    new_turn = Turn.new("Juneau", round.current_card)
    # binding.pry

    expect(new_turn.class).to equal(Turn)
  end

  it 'adds take_turn to turns array' do
    card_1 = Card.new("What is the capital of Alaska?",
                      "Juneau",
                      :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?",
                      "Mars",
                      :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?",
                      "North north west",
                      :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    round.take_turn("Juneau")
    new_turn = Turn.new("Juneau", round.current_card)
    # round.turns << new_turn
    # binding.pry

    expect(round.turns).to include(Turn)
  end

  it 'counts correct answers' do
    card_1 = Card.new("What is the capital of Alaska?",
                      "Juneau",
                      :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?",
                      "Mars",
                      :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?",
                      "North north west",
                      :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    round.take_turn("Juneau")
    new_turn = Turn.new("Juneau", round.current_card)

    # binding.pry

    expect(round.number_correct).to eq(1)
  end

  it 'updates turns count' do
    card_1 = Card.new("What is the capital of Alaska?",
                      "Juneau",
                      :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?",
                      "Mars",
                      :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?",
                      "North north west",
                      :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    round.take_turn("Juneau")
    new_turn = Turn.new("Juneau", round.current_card)

    round.take_turn("Venus")
    new_turn = Turn.new("Venus", round.current_card)
    binding.pry

    expect(round.turns.count).to eq(2)
  end

end




#
