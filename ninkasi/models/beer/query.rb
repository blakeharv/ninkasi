module Beer
  class Query

    def initialize()
    end

    def search(name)
      Neo::Session.query.match(n: :beer).where(n: {nameClean: /^.*?#{name}.*?$/i}).limit(50).return(:n).to_a
    end

    def byBrewery(id)
      Neo::Session.query.match(n: :beer).where(n: {brewery: id}).return(:n).to_a
    end

    def byStyle(id, amt = 20)

      results = []

      query = Neo4j::Core::Query.new.match('n-[:brewed]->o').where(n: {style: id}).return(:n,:o)

      query.find_in_batches(:n, :neo_id) do |batch|
        results = batch.sample(amt)
      end

      results
    end

    def byCat(id, amt = 20)
      Neo::Session.query.match(n: :beer).where(n: {category: id}).limit(amt).return(:n).to_a
    end
  end
end