module Brewery
  class Get

    attr_reader :id
    attr_reader :name
    attr_reader :description
    attr_reader :region
    attr_reader :locality
    attr_reader :imgIcon
    attr_reader :imgMedium
    attr_reader :imgLarge
    attr_reader :website

    def initialize()
      # Typically do DI here for Neo
    end

    def setAttrs(obj)
      @id = obj[:n].props[:id]
      @name = obj[:n].props[:name]
      @description = obj[:n].props[:description]
      @region = obj[:n].props[:region]
      @locality = obj[:n].props[:locality]
      @imgIcon = obj[:n].props[:imgIcon]
      @imgMedium = obj[:n].props[:imgMedium]
      @imgLarge = obj[:n].props[:imgLarge]
      @website = obj[:n].props[:website]
    end

    def format(obj)
      setAttrs(obj)
    end

    def query(id)
      brewery = Neo::Session.query.match(n: :brewery).where(n: {id: id}).return(:n).to_a[0]
      setAttrs(brewery)
    end

  end
end