module Category
  class List

    def self.get()
      [  
        {:id => 1, :name => "British Origin Ales"},
        {:id => 2, :name => "Irish Origin Ales"},
        {:id => 3, :name => "North American Origin Ales"},
        {:id => 4, :name => "German Origin Ales"},
        {:id => 5, :name => "Belgian And French Origin Ales"},
        {:id => 6, :name => "International Ale Styles"},
        {:id => 7, :name => "European-germanic Lager"},
        {:id => 8, :name => "North American Lager"},
        {:id => 9, :name => "Other Lager"},
        {:id => 10, :name => "International Styles"},
        {:id => 11, :name => "Hybrid\/mixed Beer"},
        {:id => 12, :name => "Mead, Cider, & Perry"},
        {:id => 13, :name => "Other Origin"},
        {:id => 14, :name => "Malternative Beverages"}
      ]
    end

    def self.find(id)
        list = get()

        result = ''

        list.each do |item|
            if item[:id] == id
                result = item[:name]
            end
        end

        result
    end

  end
end