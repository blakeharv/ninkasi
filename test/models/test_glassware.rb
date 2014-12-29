require File.dirname(__FILE__) + '/../helper.rb'

describe Glassware::List do
  it "returns a list of beer glasses" do
    list = Glassware::List.get()
    list[0][:name].must_equal 'Flute'
  end
end