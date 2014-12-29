module Brewery
  class Create

    def initialize(data)
      makeNode(makeProps(data))
    end

    def makeProps(data)
      {
        :id => data['id'],
        :name => data['name'],
        :nameClean => cleanStr(data['name']),
        :description => data['description'],
        :website => data['website'],
        :imgIcon => data['images'].andand['icon'],
        :imgMedium => data['images'].andand['medium'],
        :imgLarge => data['images'].andand['large'],
        :locality => data['locations'][0].andand['locality'],
        :region => data['locations'][0].andand['region'],
        :lat => data['locations'][0].andand['latitude'],
        :lon => data['locations'][0].andand['longitude'],
        :postalCode => data['locations'][0].andand['postalCode'],
        :country => data['locations'][0].andand['countryIsoCode']
      }
    end

    def makeNode(props)
      node = Neo::Node.create(props, :brewery)
      puts "Created node #{node[:name]} with labels #{node.labels.join(', ')}"
    end

    def cleanStr(str)
      str.gsub(/[^A-Za-z0-9\-\.\s]/,'')
    end

  end
end