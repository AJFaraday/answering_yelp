class Generator

  TRANSFORMS = [
    Transforms::Substitutions,
    Transforms::Answer,
    Transforms::Question,
    Transforms::Recipient
  ]

  def initialize(source, options, recipient='hard_to_yelp')
    @source = source
    @transform_arguments = {
      options: options,
      recipient: recipient
    }
  end

  def run
    result = @source.dup
    TRANSFORMS.each { |transform| result = transform.run(result, @transform_arguments) }
    result = run until result.length <= 140
    result
  end

end
