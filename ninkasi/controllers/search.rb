
Ninkasi.controller :search do

  post :index do
    data = request.env['rack.request.form_hash']
    searchTerm = data['beerName']

    results = Beer::Query.new().search(searchTerm)

    if results.length > 1
      
      beerList = []

      results.each do |item|
        beer = Beer::Get.new()
        beer.format(item)
        beerList << beer
      end

      erb :search_results, {}, {:beerList => beerList}
    elsif results.length == 1
      
      id = results[0][:n].props[:id]
      redirect "/beer/#{id}"
    else
      # make some recomendations
      erb "Oops, we got no results"
    end
  end


end   