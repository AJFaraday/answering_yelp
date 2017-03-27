module Transforms

  # If the source is a question, add a question mark.
  # If it isn't, take the question mark away.

  class Answer
    include Singleton

    def self.run(source, arguments={})
      @options = arguments[:options]
      set_cursor
      template = self.template
      source.gsub(/how hard is it to/i, template)
    end

    def self.template
      @cursor = (@cursor + 1) % @options.length
      @options[@cursor - 1]
    end

    def self.set_cursor
      @cursor = rand(@options.count)
    end

  end
end
