class RenameTargetDapartmentToTargetDepartmentInEvents < ActiveRecord::Migration[7.2]
  def change
    # rename_column :テーブル名, :今の名前, :新しい名前
    rename_column :events, :target_dapartment, :target_department
  end
end
