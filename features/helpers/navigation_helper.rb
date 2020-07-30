# Simple helper that makes navigating using the config file easier
# It will check if a given string is a URL or a config value and goto that page accordingly

##################################
# General navigation helpers
##################################

require 'lapis_lazuli'

module Nav
  extend LapisLazuli
  class << self
    # Navigates to a given URL or page.url configuration if the current URL is not the same
    # Then confirms that the new URL is loaded.
    def to(page_or_url, language=$language, force_refresh = false)
      if env_or_config("pages.#{language}.#{page_or_url}")
        browser.goto env_or_config("pages.#{language}.#{page_or_url}")
      elsif is_url?(page_or_url)
        #Is it an url?
        uri = URI.parse(page_or_url)
        if %w( http https ).include?(uri.scheme)
          browser.goto page_or_url
        end
      else
        raise "#{page_or_url} is not a url or page in the config file"
      end
    end

    # Confirms if the given URL is a valid URL
    def is_url? string
      begin
        uri = URI.parse(string)
        %w( http https ).include?(uri.scheme)
      rescue URI::BadURIError
        false
      rescue URI::InvalidURIError
        false
      end
    end
  end
end