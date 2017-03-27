require 'spec_helper'

module Transforms
  describe Answer do

    let(:options) {
      [
        "It's really easy to",
        "It's pretty difficult, when it comes down to it, to just buckle down and start trying to",
        "I can't",
      ]
    }

    it 'should pick one of the options and add it to the string' do
      allow(Transforms::Answer).to receive(:rand).and_return(2)
      result = Transforms::Answer.run(
        'How hard is it to find some better ingredients?',
        {options: options}
      )
      result.should eq("I can't find some better ingredients?")
    end

  end
end
