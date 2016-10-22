Hanami::Model.migration do
  change do
    create_table :entry_sections do
      primary_key :id, :uuid, default: Sequel.function(:uuid_generate_v4)
      foreign_key :entry_id, :entries, type: :uuid, on_delete: :restrict, null: false

      column :position,      Integer,    null: false,   default: 0

      column :created_at,    DateTime,   null: false
      column :updated_at,    DateTime,   null: false
    end
  end
end
