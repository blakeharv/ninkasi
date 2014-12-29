
Ninkasi.controller :beer do

  get :index, :with => :id, :cache => true do
    expires 3600
    beerId = params[:id]

    beer = Beer::Get.new()
    beer.query(beerId)

    brewery = Brewery::Get.new()
    brewery.query(beer.breweryId)

    results = Beer::Query.new().byStyle(beer.styleId)

    beerList = []

    results.each do |item|
      stylebeer = Beer::Get.new()
      stylebeer.format(item)
      beerList << stylebeer
    end

    erb :beer, {}, {:beer => beer, :brew => brewery, :beerList => beerList}
  end


end 