Hanami::Model.migration do
  change do
    create_table :users do
      primary_key :id,
                  'uuid',
                  null:
                  false,
                  default: Hanami::Model::Sql.function(:uuid_generate_v4)

      column :email, String, null: false, unique: true, size: 128, index: true
      column :name, String, null: false

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
