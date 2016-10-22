class EntrySectionRepository
  include Hanami::Repository

  def self.all_by_entry(entry, _params = {})
    query do
      where(entry_id: entry.id).asc(:position)
    end.all
  end

end
