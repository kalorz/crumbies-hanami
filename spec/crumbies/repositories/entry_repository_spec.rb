require 'spec_helper'

describe EntryRepository do
  UUID_V4_PATTERN = /^[0-9A-F]{8}-[0-9A-F]{4}-4[0-9A-F]{3}-[89AB][0-9A-F]{3}-[0-9A-F]{12}$/i

  after do
    EntryRepository.clear
  end

  it 'stores id as UUID' do
    entry = EntryRepository.create(Entry.new)

    entry.id.must_match UUID_V4_PATTERN
  end

end
