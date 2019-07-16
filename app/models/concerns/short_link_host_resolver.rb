class ShortLinkHostResolver

  # Get's the host URL of the web application.
  def self.get_host_url
    # TODO: Improve the host resolution.
    @@host_url ||= if Rails.env.production?
      'https://link.sl'
    else
      'http://localhost:3000'
    end
  end

end