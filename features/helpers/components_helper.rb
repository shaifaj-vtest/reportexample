# Simple helper that makes navigating using the config file easier
# It will check if a given string is a URL or a config value and goto that page accordingly

##################################
# product list page items
##################################
module PLPage
  extend LapisLazuli
  class << self

    def products
      browser.as(href: /\/itm\//)
    end
  end
end

##################################
# product detail page items
##################################
module PDPage
  extend LapisLazuli
  class << self

    def productdetails
      browser.wait(like: [:div, :class, 'itemAdttr'], timeout: 30, throw: false)
    end

  end
end