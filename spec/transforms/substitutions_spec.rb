require 'spec_helper'

module Transforms
  describe Substitutions do

    it 'should change my to your' do
      result = Substitutions.run("It's hard as nails to heat up my chips.")
      result.should eq("It's hard as nails to heat up your chips.")
    end

    it 'should change your to my' do
      result = Substitutions.run("It's pretty easy to memorise your menu.")
      result.should eq("It's pretty easy to memorise my menu.")
    end
    
    it 'should manage both' do
      result = Substitutions.run("It's easy to get your act together and heat my chips")
      result.should_not eq("It's easy to get your act together and heat your chips")
      result.should_not eq("It's easy to get my act together and heat my chips")
      result.should eq("It's easy to get my act together and heat your chips")
    end

  end
end
