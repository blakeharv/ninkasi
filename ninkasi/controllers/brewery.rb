
Ninkasi.controller :brewery do

  get :index, :with => :id, :cache => true do
    expires 3600

    brewId = params[:id]

    brew = Brewery::Get.new()
    brew.query(brewId)

    results = Beer::Query.new().byBrewery(brewId)

    beerList = []

    results.each do |item|
      beer = Beer::Get.new()
      beer.format(item)
      beerList << beer
    end
    
    erb :brewery, {}, {:brew => brew, :beerList => beerList}
  end


end 