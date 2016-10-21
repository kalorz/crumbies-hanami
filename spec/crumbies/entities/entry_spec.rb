require 'spec_helper'

describe Entry do
  
  it 'can be initialised with attributes' do
    entry = Entry.new(title: 'Hello World!')

    entry.title.must_equal 'Hello World!'
  end

end
