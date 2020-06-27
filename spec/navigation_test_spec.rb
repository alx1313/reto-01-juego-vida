# frozen_string_literal: true

require './navigation'
require './universe'
# describe
# it
# expect

describe Navigation do
  Navigation.new
  Universe.new
  describe 'view' do
    it 'pasa por casillas para hacer cambios especificos' do
      expect(Navigation.view(3, 3)).to eq(Universe.access_planet(3, 3))
    end
  end
end
