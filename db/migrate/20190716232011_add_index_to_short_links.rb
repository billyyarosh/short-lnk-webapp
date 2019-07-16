class AddIndexToShortLinks < ActiveRecord::Migration[5.2]
  def change
    add_index :short_links, :link
  end
end
