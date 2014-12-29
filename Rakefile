require 'bundler/setup'
require 'padrino-core/cli/rake'


namespace :import do
  desc "Import beers to database"
  task :beer => :environment do

    data = Util::BrewDB.beerList()
    totalPages = data['numberOfPages']
    currentPage = 1

    while currentPage <= totalPages do
      puts "On page: #{currentPage}"

      data = Util::BrewDB.beerList({p: currentPage})

      beerList = data['data']

      beerList.each do |beer|
        country = beer['breweries'].andand[0].andand['locations'].andand[0].andand['countryIsoCode']
        node = Neo::Session.query.match(n: :beer).where(n: {id: beer['id']}).return(:n).response.data[0].andand[0].andand['data']
        if country == 'US' && node.nil?
          Beer::Create.new(beer)
        else
          puts "Skipping #{beer['name']}"
        end
      end

      currentPage += 1
    end
  end

  desc "Import breweries to database"
  task :brewery => :environment do

    data = Util::BrewDB.breweryList()
    totalPages = data['numberOfPages']
    currentPage = 1

    while currentPage <= totalPages do
      puts "On page: #{currentPage}"

      data = Util::BrewDB.breweryList({p: currentPage})

      brewList = data['data']

      brewList.each do |brewery|
        country = brewery['locations'].andand[0].andand['countryIsoCode']
        node = Neo::Session.query.match(n: :brewery).where(n: {id: brewery['id']}).return(:n).response.data[0].andand[0].andand['data']
        if country == 'US' && node.nil?
          Brewery::Create.new(brewery)
        else
          puts "Skipping #{brewery['name']}"
        end
      end

      currentPage += 1
    end
  end

  desc "Import beer styles to database"
  task :style => :environment do

    styleList = Util::BrewDB.styleList()

    styleList.each do |style|
      node = Neo::Session.query.match(n: :style).where(n: {id: style['id']}).return(:n).response.data[0].andand[0].andand['data']
      if node.nil?
        Style::Create.new(style)
      else
        puts "Skipping #{style['name']}"
      end
    end

  end

end


namespace :connect do
  desc "Connect styles by category"
  task :style => :environment do

    catList = Category::List.get()

    catList.each do |cat|
      
      puts cat[:name]
      catStyles = Style::Query.new().category(cat[:id])
      combo = catStyles.repeated_combination(2).to_a 

      combo.each do | n1, n2 |
        id1 = n1[:n].neo_id
        id2 = n2[:n].neo_id
        if id1 != id2
          puts "making connection between #{id1} and #{id2}"
          Neo::Relationship.create(:sameCategory, n1[:n], n2[:n], {categoryId: cat[:id], categoryName: cat[:name]})
        else
          puts "skipping this set"
        end
      end
    end
  end

  desc "Connect beers to brewery"
  task :beerbrew => :environment do

    iterating = true
    query = Neo4j::Core::Query.new.match(n: :beer).return(:n)
    iter = 0

    while iterating do
      node = query.where(n: {neo_id: iter}).to_a
      if node != []
        beerNode = node[0]
        brewNode = Neo::Session.query.match(n: :brewery).where(n: {id: beerNode[:n].props[:brewery]}).return(:n).to_a[0]
        brewId = brewNode[:n].props[:id]
        brewName = brewNode[:n].props[:name]
        puts "Connected #{brewName} with #{beerNode[:n].props[:name]}"
        Neo::Relationship.create(:brewed, beerNode[:n], brewNode[:n], {id: brewId, name: brewName})
        iter += 1
      else
        iterating = false
      end
    end
  end

  desc "Connect breweries by location"
  task :brewery => :environment do

  end

end


PadrinoTasks.init