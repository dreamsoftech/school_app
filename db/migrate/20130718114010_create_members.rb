class CreateMembers < ActiveRecord::Migration
  def change
  	create_table :groups do |t|
    	t.string :name
    	t.string :timezone
    	t.string :description

      t.timestamps
    end
    
    create_table :members do |t|
    	t.belongs_to :group
    	t.string :first_name
    	t.string :last_name
    	t.string :email

      t.timestamps
    end

    create_table :daily_logs do |t|
      t.belongs_to :member
      t.string :subject
      t.string :content
      
      t.timestamps
    end
  end
end
