module Transforms

  # If the source is a question, add a question mark.
  # If it isn't, take the question mark away.

  class Substitutions
    include Singleton

    SUBS = {
      ' my ' => ' your ',
      ' your ' => ' my ',
      ' our ' => ' your ',
      ' me ' => ' you ',
      ' you ' => ' me '
    }

    def self.run(source, arguments={})
      source = source.dup
      subs = Array.new
      SUBS.each do |from, to|
        if source.index(from)
          subs << Sub.new(source.index(from), from.length, to)
        end
      end
      subs.sort!{|a,b| b.index <=> a.index}
      subs.each do |substitution|
        source.slice!(substitution.index, substitution.length)
        source.insert(substitution.index, substitution.new_string)
      end
      source
    end

    class Sub

      attr_accessor :index, :length, :new_string

      def initialize(index, length, new_string)
        @index = index
        @length = length
        @new_string = new_string
      end

    end

  end
end
