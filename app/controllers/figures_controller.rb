class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    #binding.pry
    erb :'/figures/new'
  end

  post '/figures' do
    #binding.pry
    @figure = Figure.create(params["figure"])
    if !params["landmark"]["name"].empty?
      @figure.landmarks << Landmark.create(name: params["landmark"]["name"])
    end
    if !params["title"]["name"].empty?
      @figure.titles << Title.create(name: params["title"]["name"])
    end
    @figure.save
    redirect '/figures'
  end

  get '/figures/:id' do
    @figure = Figure.find(params["id"])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    #binding.pry
    @figure = Figure.find(params["id"])
    erb :'/figures/edit'
  end

  post '/figures/:id' do
    #binding.pry
    @figure = Figure.find(params["id"])
    @figure.update(params["figure"])
    if !params["landmark"]["name"].empty?
      @figure.landmarks << Landmark.create(name: params["landmark"]["name"])
    end
    if !params["title"]["name"].empty?
      @figure.titles << Title.create(name: params["title"]["name"])
    end
    @figure.save
    redirect "/figures/#{@figure.id}"
  end

end
