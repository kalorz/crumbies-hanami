require 'hanami/model'
require 'hanami/mailer'
Dir["#{ __dir__ }/crumbies/**/*.rb"].each { |file| require_relative file }

Hanami::Model.configure do
  ##
  # Database adapter
  #
  # Available options:
  #
  #  * File System adapter
  #    adapter type: :file_system, uri: 'file:///db/bookshelf_development'
  #
  #  * Memory adapter
  #    adapter type: :memory, uri: 'memory://localhost/crumbies_development'
  #
  #  * SQL adapter
  #    adapter type: :sql, uri: 'sqlite://db/crumbies_development.sqlite3'
  #    adapter type: :sql, uri: 'postgres://localhost/crumbies_development'
  #    adapter type: :sql, uri: 'mysql://localhost/crumbies_development'
  #
  adapter type: :sql, uri: ENV['DATABASE_URL']

  ##
  # Migrations
  #
  migrations 'db/migrations'
  schema     'db/schema.sql'

  ##
  # Database mapping
  #
  # Intended for specifying application wide mappings.
  #
  mapping do
    collection :entries do
      entity     Entry
      repository EntryRepository

      attribute :id,          String
      attribute :title,       String
      attribute :happened_at, DateTime
      attribute :created_at,  DateTime
      attribute :updated_at,  DateTime
    end
  end
end.load!

Hanami::Mailer.configure do
  root "#{ __dir__ }/crumbies/mailers"

  # See http://hanamirb.org/guides/mailers/delivery
  delivery do
    development :test
    test        :test
    # production :smtp, address: ENV['SMTP_PORT'], port: 1025
  end
end.load!
