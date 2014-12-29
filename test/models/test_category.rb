require File.dirname(__FILE__) + '/../helper.rb'

describe Category::List do
  it "returns a list of beer categories" do
    list = Category::List.get()
    list[0][:name].must_equal 'British Origin Ales'
  end

  it "returns a category name" do
    result = Category::List.find(8)
    result.must_equal 'North American Lager'
  end

end