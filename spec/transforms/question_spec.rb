require 'spec_helper'

module Transforms
  describe Question do

    it 'should add a question mark if if it is a question and has no punctuation' do
      result = Question.run('why do people want me to make a sandwhich')
      result.should eq('why do people want me to make a sandwhich?')
    end

    it 'should change full stops to a question mark if if it is a question and has punctuation' do
      result = Question.run('why do people want me to make a sandwhich.')
      result.should eq('why do people want me to make a sandwhich?')
    end

    it 'should remove a question mark if it is not a question' do
      result = Question.run("It's really easy to dress a salad?")
      result.should eq("It's really easy to dress a salad.")
    end

    it 'should not add a second question mark' do
      result = Question.run("Why do people want me to dress a salad?")
      result.should_not eq("Why do people want me to dress a salad??")
      result.should eq("Why do people want me to dress a salad?")
    end

  end
end
