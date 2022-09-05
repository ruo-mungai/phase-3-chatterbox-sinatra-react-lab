class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add routes
  get '/messages' do
    mes=Message.all
    mes.to_json
  end 

  post '/messages' do 
    mes=Message.create(
      body: params[:body], 
      username: params[:username]
    )
    mes.to_json
  end

  patch '/messages/:id' do
    pat=Message.find(params[:id])
    pat.update(body: params[:body])
    pat.to_json
  end

  delete '/messages/:id' do
    del=Message.find(params[:id])
    del.destroy
    del.to_json
  end

   
end
