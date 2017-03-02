class Generator

  def initialize(source, options)
    @source = source
    @options = options
    set_cursor
  end

  def template
    @cursor = (@cursor + 1) % @options.length
    @options[@cursor - 1]
  end

  def run
    template = self.template
    result = @source.gsub(/how hard is it to/i, template)
    result = "@hard_to_yelp #{result}"
    result = run until result.length <= 140
    result
  end

  private

  def set_cursor
    @cursor = rand(@options.count)
  end

end
