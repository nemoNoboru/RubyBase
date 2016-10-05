require 'active_record'

ActiveRecord::Base.logger = Logger.new(STDERR)

ActiveRecord::Base.establish_connection(
  :adapter  => 'sqlite3',
  :database => 'sincro.db'
)

ActiveRecord::Schema.define do
  unless ActiveRecord::Base.connection.tables.include? 'tasks'
    create_table :tasks do |table|
      table.column :title,  :string
      table.column :status_id, :integer
      table.column :done,   :bool
      table.column :description,  :string
    end
  end

  unless ActiveRecord::Base.connection.tables.include? 'statuses'
    create_table :statuses do |table|
      table.column :name,     :string
    end
  end
end

class Status < ActiveRecord::Base
  has_many :tasks
end

class Task < ActiveRecord::Base
  belongs_to :status
end
