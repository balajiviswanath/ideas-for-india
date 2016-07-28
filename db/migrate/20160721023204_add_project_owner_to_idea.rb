class AddProjectOwnerToIdea < ActiveRecord::Migration
  def change
    add_foreign_key :ideas, :users, column: :project_owner_id
    add_reference :ideas, :project_owner, references: :users, index: true
  
    
  end
end
