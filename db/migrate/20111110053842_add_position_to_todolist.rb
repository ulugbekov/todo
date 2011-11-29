class AddPositionToTodolist < ActiveRecord::Migration
  def change
    add_column :todolists, :position, :string
  end
end
