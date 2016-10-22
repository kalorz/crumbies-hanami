class Entry
  include Hanami::Entity

  attributes :title, :happened_at, :created_at, :updated_at

  def sections(params = {})
    EntrySectionRepository.all_by_entry(self, params)
  end

end
