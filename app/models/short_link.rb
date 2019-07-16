class ShortLink < ApplicationRecord

  validates :full_url, :presence => true, :url => true

end
