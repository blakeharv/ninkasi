module Style
  class Query

    def initialize()
    end

    def category(int)
      query = Neo::Session.query.match(n: :style).where(n: {category: int}).return(:n).to_a
    end

  end
end