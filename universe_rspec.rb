# frozen_string_literal: true

require 'rspec'
require_relative 'universe.rb'
require_relative 'rules.rb'

# describe
# it
# expect

describe Rules do
  describe rule_1 do
    it 'correcto' do
      news = Rules.new
      dox = Universe.new
      expect(news.rule_1(0, 0)).to eq(dox.acp(0, 0))
    end
  end
end
