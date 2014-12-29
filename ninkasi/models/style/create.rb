module Style
  class Create

    def initialize(data)
      makeNode(makeProps(data))
    end

    def makeProps(data)
      {
        :id => data['id'],
        :name => data['name'],
        :description => data['description'],
        :category => data['categoryId'],
        :categoryName => data['category'].andand['name'],
        :srmMax => data['srmMax'],
        :srmMin => data['srmMin'],
        :ibuMax => data['ibuMax'],
        :ibuMin => data['ibuMin'],
        :fgMax => data['fgMax'],
        :fgMin => data['fgMin'],
        :abvMax => data['abvMax'],
        :abvMin => data['abvMin'],
        :ogMax => data['ogMax'],
        :ogMin => data['ogMin']
      }
    end

    def makeNode(props)
      node = Neo::Node.create(props, :style)
      puts "Created node #{node[:name]} with labels #{node.labels.join(', ')}"
    end

  end
end