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
    generator.instance_variable_get(:@options).should eq(options)
  end

  it 'should set a cursor at a random position' do
    generator = Generator.new(source, options)
    generator.instance_variable_get(:@cursor).should be_a(Integer)
    generator.instance_variable_get(:@cursor).should be >= 0
    generator.instance_variable_get(:@cursor).should be < options.length
  end

  it 'should get a template from config' do
    generator = Generator.new(source, options)
    option1 = generator.template
    options.should include(option1)
    # It'll then get the next one
    option2 = generator.template
    option2.should_not eq(option1)
    options.should include(option2)
  end

  it 'should loop back when it gets to the end' do
    generator = Generator.new(source, options)
    generator.instance_variable_set(:@cursor, 2)
    generator.template.should eq(options[2])
    # next call takes us back to the start
    generator.template.should eq(options[0])
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
    generator = Generator.new(source, options)
    generator.instance_variable_set(:@cursor, 1) # This one makes it too long
    # based on option index 2
    generator.run.should eq("@hard_to_yelp It's so easy to just do the thing totally right without complaining or eating off my plate.")
    # it's skipped 2, not 1
    generator.instance_variable_get(:@cursor).should eq(0)
  end

end

