module Beer
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
        :abv => data['abv'],
        :srmId => data['srmId'],
        :srmHex => data['srm'].andand['hex'],
        :style => data['style'].andand['id'],
        :category => data['style'].andand['categoryId'],
        :brewery => data['breweries'][0].andand['id'],
        :glassId => data['glass'].andand['id'],
        :glasName => data['glass'].andand['name']
      }
    end

    def makeNode(props)
      node = Neo::Node.create(props, :beer)
      puts "Created node #{node[:name]} with labels #{node.labels.join(', ')}"
    end

    def cleanStr(str)
      str.gsub(/[^A-Za-z0-9\-\.\s]/,'')
    end

  end
end