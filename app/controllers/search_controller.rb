class SearchController < ApplicationController
  def search
  	@range = params[:range]
    search = params[:search]
    word = params[:word]

    # [1,2,3,4,5]
    # test =  {
    # 	id: 1,
    # 	name: ""
    # }
    # test[:id] # => 1
    # params[:range] # => ""
    # '1' == '' # => false
	if @range == '1'
     	@user = User.search(search,word)
 	else
    	@book = Book.search(search,word)
	end
  end
end
