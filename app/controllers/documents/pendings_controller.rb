class Documents::PendingsController < ApplicationController
  def index
    @documents = Document.pending
  end

  def edit
    @document = Document.find(params['id'])
  end

  def update
    puts 'kkkkkkk'
    p params
  end


end
