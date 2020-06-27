# frozen_string_literal: true

require './rules'
require './universe'
# describe
# it
# expect

describe Rules do
  Rules.new
  Universe.new
  describe 'alive_rules' do
    it 'Si hay 1 vecino o menos, y hay vida (1), se muere' do
      expect(Rules.alive_rules(1, 1, 0)).not_to be(1)
    end

    it 'si hay 2 vecinos, y hay vida (1), vive, si no hay, se mantiene' do
      expect(Rules.alive_rules(2, 1, 0)).not_to be(nil)
    end

    it 'si hay 3 vecinos y hay vida(1), vive, y si no hay, se genera' do
      expect(Rules.alive_rules(3, 1, 0)).not_to be(0)
    end
  end
end
