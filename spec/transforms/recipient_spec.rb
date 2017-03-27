require 'spec_helper'

module Transforms
  describe Recipient do

    let(:arguments) {{recipient: 'how_to_yelp'}}

    it 'should add the recipient to the start of anything' do
      Recipient.run("It's pretty easy to juggle.", arguments)
    end

  end
end
