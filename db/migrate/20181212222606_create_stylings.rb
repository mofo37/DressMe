class CreateStylings < ActiveRecord::Migration[5.2]
  def change
    create_table :stylings do |t|
      t.references :outfit, foreign_key: true
      t.references :piece, foreign_key: true

      t.timestamps
    end
  end
end
