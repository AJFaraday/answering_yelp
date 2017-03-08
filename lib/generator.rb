class Generator

  def initialize(source, options, recipient='hard_to_yelp')
    @source = source
    @options = options
    @recipient = recipient
    set_cursor
  end

  def template
    @cursor = (@cursor + 1) % @options.length
    @options[@cursor - 1]
  end

  def run
    template = self.template
    result = @source.gsub(/how hard is it to/i, template)
    result = add_recipient(result)
    result = fix_punctuation(result)
    result = run until result.length <= 140
    result
  end

  private

  def add_recipient(message)
    "@#{@recipient} #{message}"
  end

  def fix_punctuation(message)
    message.gsub('?', '.')
  end

  def set_cursor
    @cursor = rand(@options.count)
  end

end
