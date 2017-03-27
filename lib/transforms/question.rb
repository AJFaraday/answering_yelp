module Transforms

  # If the source is a question, add a question mark.
  # If it isn't, take the question mark away.

  class Question
    include Singleton

    QUESTION_WORDS = %w{why where which who}

    def self.run(source, arguments={})
      if is_question?(source)
        has_punctuation?(source) ? source.gsub('.', '?') : source + '?'
      else
        source.gsub('?', '.')
      end
    end

    def self.is_question?(source)
      src = source.downcase
      QUESTION_WORDS.any? { |q| src.index(q) }
    end

    private_class_method :is_question?

    def self.has_punctuation?(source)
      source.index('.') || source.index('?')
    end

    private_class_method :has_punctuation?

  end
end
