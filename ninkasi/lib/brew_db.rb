require 'oj'
require 'typhoeus'

module Util
  class BrewDB

    @@brewApi = 'http://api.brewerydb.com/v2/'
    @@apiKey = 'MY_API_KEY'

    def self.beerList(opts = {})
      opts.merge!({withIngredients: 'Y', withBreweries: 'Y'})
      makeRequest('beers', opts)
    end

    def self.beer(id, opts = {})
      opts.merge!({withIngredients: 'Y', withBreweries: 'Y'})
      data = makeRequest("beer/#{id}", opts)
      data['data']
    end

    def self.breweryList(opts = {})
      opts.merge!({withLocations: 'Y'})
      makeRequest('breweries', opts)
    end

    def self.brewery(id, opts = {})
      opts.merge!({withLocations: 'Y'})
      data = makeRequest("brewery/#{id}", opts)
      data['data']
    end

    def self.styleList()
      data = makeRequest("styles")
      data['data']
    end

    private

    def self.makeRequest(endpoint, opts = {})
      url = @@brewApi + endpoint
      opts.merge!({key: @@apiKey})
      request = Typhoeus.get(url, params: opts )
      data = Oj.load(request.body)
      if data['status'] == 'success'
        data
      else
        puts("HTTP request failed: " + request.code.to_s + ": " + data['status'])
        {}
      end
    end

  end
end