module Style
  class Get

    attr_reader :id
    attr_reader :name
    attr_reader :description

    def initialize()
    end

    def setAttrs(obj)
      @id = obj[:n].props[:id]
      @name = obj[:n].props[:name]
      @description = obj[:n].props[:description]
    end

    def query(id)
      style = Neo::Session.query.match(n: :style).where(n: {id: id}).return(:n).to_a[0]
      setAttrs(style)
    end
  end
end