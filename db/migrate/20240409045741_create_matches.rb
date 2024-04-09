class CreateMatches < ActiveRecord::Migration[7.1]
  def change
    create_table :matches do |t|
      t.references :likes
      t.references :liked
      t.timestamps
    end
  end
end
