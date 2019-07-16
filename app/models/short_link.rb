class ShortLink < ApplicationRecord

  validates :full_url, :presence => true, :url => true

  # Always generating a new link on any new save.
  before_save :generate_short_link

  private

  def generate_short_link
    # loop until we have generated a link not already in the database.
    begin
      self.link = ShortLinkHostResolver.get_host_url + '/'+ generate_link_uid
    end until ShortLink.find_by(link: self.link) == nil
  end

  # Generate an ID with random upper, lower characters, with random digits 8 characters long.
  # Number of random possibilities is 62^8
  def generate_link_uid
    upper_chars = ('A'..'Z')
    lower_chars = ('a'..'z')
    single_digit_chars = ('0'..'9')

    [*upper_chars, *lower_chars, *single_digit_chars].shuffle[0,8].join
  end

end
