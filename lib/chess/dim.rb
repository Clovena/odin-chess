# frozen_string_literal: true

# Methods to access global Board dimensions
module Dim
  def self.size
    8
  end

  def self.files
    [nil, 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h'].freeze
  end
end
