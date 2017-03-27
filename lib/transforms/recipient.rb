module Transforms

  # If the source is a question, add a question mark.
  # If it isn't, take the question mark away.

  class Recipient
    include Singleton

    def self.run(source, arguments={})
      "@#{arguments[:recipient]} #{source}"
    end

  end
end
