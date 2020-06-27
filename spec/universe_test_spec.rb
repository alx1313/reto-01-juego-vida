# frozen_string_literal: true

require './universe'

# describe
# it
# expect

describe Universe do
  describe 'change_life' do
    it 'La casilla no tiene vida' do
      Universe.new
      expect(Universe.change_life(0, 0, 0)).to eq(0)
    end
  end
end
