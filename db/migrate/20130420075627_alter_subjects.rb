class AlterSubjects < ActiveRecord::Migration
  def up
	rename_column("subjects", "postion", "position")
  end

  def down
  	rename_column("subjects", "position", "postion")
  end
end
w