require 'spec_helper'

describe Post do

  it 'can be initialised with attributes' do
    post = Post.new(title: 'Hello World!')

    post.title.must_equal 'Hello World!'
  end

end
