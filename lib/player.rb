# frozen_string_literal: true

# Player class definition
class Player
  attr_reader :name, :mark, :choices
  def initialize(name, mark)
    @name = name
    @mark = mark
    @choices = []
  end
end
