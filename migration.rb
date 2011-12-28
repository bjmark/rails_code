rails generate migration NAME [field:type field:type] [options]

def self.up
	# Phone number fields are not integers, duh!
	change_column :clients, :phone, :string
end
def self.down
	raise ActiveRecord::IrreversibleMigration
end

class CreateClients < ActiveRecord::Migration
	def self.up
		create_table :clients do |t|
			t.string :name
			t.string :code
			t.timestamps
		end
	end
	def self.down
		drop_table :clients
	end
end

rake db:migrate VERSION=20090124223305

create_table :ingredients_recipes, :id => false do |t|
	t.column :ingredient_id, :integer
	t.column :recipe_id, :integer
end

create_table :clients, :id => :clients_id do |t|
	t.column :name, :string
	t.column :code, :string
	t.column :created_at, :datetime
	t.column :updated_at, :datetime
end

change_table(:clients) do |t| 
	t.change(:name, :string, :limit => 80)
	t.change_default(:qualification, 'new')
	t.column(:name, :string)
	t.string(:goat)
	t.string(:goat, :sheep)
	t.integer(:age, :quantity)	
	# a simple index
	t.index(:name)
	# a unique index
	t.index([:branch_id, :party_id], :unique => true)
	# a named index
	t.index([:branch_id, :party_id], :unique => true, :name =>'by_branch_party')	
	# remove the accounts_branch_id_index from the accounts table
	t.remove_index :column => :branch_id
	# remove the accounts_branch_id_party_id_index from the accounts table
	t.remove_index :column => [:branch_id, :party_id]
	# remove the index named by_branch_party in the accounts table
	t.remove_index :name => :by_branch_party
	t.remove_belongs_to(:person)
	t.remove_references(:commentable, :polymorphic => true)	
end

create_table :accounts do
	t.belongs_to(:person)
end

create_table :comments do
	t.references(:commentable, :polymorphic => true)
end

The :force => true option tells the migration to go ahead and drop the table being
defined if it exists

