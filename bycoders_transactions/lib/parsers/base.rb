module Parsers
  class Base
    def initialize(opts = {})
      @file = File.open(opts[:file])
    end

    def read
      @file.read
    end

    def readlines
      @file.readlines.map(&:chomp)
    end
  end
end
