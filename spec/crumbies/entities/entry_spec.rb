require 'spec_helper'

describe Entry do
  
  it 'can be initialised with attributes' do
    entry = Entry.new(title: 'Hello World!', happened_at: DateTime.new(2016, 10, 21, 21, 29))

    entry.title.must_equal 'Hello World!'
    entry.happened_at.must_equal DateTime.new(2016, 10, 21, 21, 29)
  end

end
