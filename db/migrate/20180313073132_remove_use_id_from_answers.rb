class RemoveUseIdFromAnswers < ActiveRecord::Migration
  def change
    remove_column :answers, :use_id, :integer
  end
end
