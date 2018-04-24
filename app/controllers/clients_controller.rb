class ClientsController < ApplicationController
  def index
    @clients = Client.all
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(params_client)
    @client.code = rand(1000...9999)
    if @client.save
       render json: @client
    else
       render json: @client.errors.messages
    end
  end

  def login
    @client = Client.find_by(phone: params_client[:phone])
    if @client.authenticate(params[:code])
      flash: { error: true, message: 'Logado' }
    else
      flash: { error: true, message: 'Codigo invalido' }
    end
  end

  private
    def params_client
      params.require(:client).permit(:phone, :code)
    end
end
