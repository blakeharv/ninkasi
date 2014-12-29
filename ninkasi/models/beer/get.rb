module Beer
  class Get

    attr_reader :id
    attr_reader :name
    attr_reader :description
    attr_reader :glassId
    attr_reader :glasName
    attr_reader :srmHex
    attr_reader :srmId
    attr_reader :abv
    attr_reader :breweryId
    attr_reader :category
    attr_reader :style
    attr_reader :styleId
    attr_reader :breweryName
    attr_reader :breweryLocality
    attr_reader :breweryRegion

    def initialize()
      # Typically do DI here for Neo, Category, and Style classes
    end

    def setAttrs(obj)
      @id = obj[:n].props[:id]
      @name = obj[:n].props[:name]
      @description = obj[:n].props[:description]
      @glassId = obj[:n].props[:glassId]
      @glasName = obj[:n].props[:glasName]
      @srmHex = obj[:n].props[:srmHex]
      @srmId = obj[:n].props[:srmId]
      @abv = obj[:n].props[:abv]
      @breweryId = obj[:n].props[:brewery]
      @category = getCategory(obj[:n].props[:category])
      @style = getStyle(obj[:n].props[:style])
      @styleId = obj[:n].props[:style]

      if obj.members.include?(:o)
        @breweryName = obj[:o].props[:name]
        @breweryLocality = obj[:o].props[:locality]
        @breweryRegion = obj[:o].props[:region]
      end
    end

    def format(obj)
      setAttrs(obj)
    end

    def query(id)
      beer = Neo::Session.query.match(n: :beer).where(n: {id: id}).return(:n).to_a[0]
      setAttrs(beer)
    end

    private

    def getCategory(id)
      if !id.nil?
        Category::List.find(id)
      else
        nil
      end
    end

    def getStyle(id)
      if !id.nil?
        style = Style::Get.new()
        style.query(id)
        style.name
      else
        nil
      end
    end

  end
end