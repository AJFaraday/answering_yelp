require 'spec_helper'

describe Generator do

  # 93 characters
  let(:source) { 'how hard is it to just do the thing totally right without complaining or eating off my plate?' }

  let(:options) do
    [
      "I don't know how to",
      "It's actually pretty difficult, when I'm busy, to just buckle down and",
      "It's so easy to"
    ]
  end

  it 'should initialise with tweet text and options' do
    generator = Generator.new(source, options)
    generator.instance_variable_get(:@source).should eq(source)
    generator.instance_variable_get(:@transform_arguments)[:options].should eq(options)
  end

  it 'should return a modified tweet' do
    generator = Generator.new(
      'How hard is it to make a cheese enchilada?',
      ["I've never tried to"]
    )
    generator.run.should eq("@hard_to_yelp I've never tried to make a cheese enchilada.")
  end

  it 'should cut off the start, regardless of case' do
    generator = Generator.new(
      'how hard iS IT to make a cheese ENchilada?',
      ["I've never tried to"]
    )
    generator.run.should eq("@hard_to_yelp I've never tried to make a cheese ENchilada.")
  end

  it 'should remove any question marks' do
    generator = Generator.new(
      'how hard is it to eat a cow?',
      ["I've never tried to"]
    )
    generator.run.should eq("@hard_to_yelp I've never tried to eat a cow.")
  end

  it 'should choose again if the tweet is too long' do
    20.times do
      generator = Generator.new(source, options)
      # based on option index 2
      generator.run.length.should be < 140
    end
  end

  it 'should add a question mark if the result is a question' do
    generator = Generator.new(source, ['Why do people want me to'])
    # also, my => your
    generator.run.should eq("@hard_to_yelp Why do people want me to just do the thing totally right without complaining or eating off your plate?")
  end

  it 'should change my to your' do
    generator = Generator.new('How hard is it to not eat off my plate?', ['Why do people want me to'])
    generator.run.should eq('@hard_to_yelp Why do people want me to not eat off your plate?')
  end

end

