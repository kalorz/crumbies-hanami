Hanami::Model.migration do
  change do
    create_table :entries do
      primary_key :id, :uuid, default: Sequel.function(:uuid_generate_v4)

      column :title,            String
      column :happened_at,      DateTime,   null: false
      column :sections_count,   Integer,    null: false,   default: 0

      column :created_at,       DateTime,   null: false
      column :updated_at,       DateTime,   null: false
    end
  end
end
