class Api::V1::VeiculosController < ApplicationController
  before_action :set_api_v1_veiculo, only: [:show, :update, :destroy]
  skip_before_action :verify_authenticity_token #NAO UTILIZAR EM PRODUCAO
  # GET /api/v1/veiculos
  def index
    @api_v1_veiculos = Veiculo.all

    render json: @api_v1_veiculos
  end

  # GET /api/v1/veiculos/1
  def show
    render json: @api_v1_veiculo
  end

  # POST /api/v1/veiculos
  def create
    @api_v1_veiculo = Veiculo.new(api_v1_veiculo_params)
    
    if @api_v1_veiculo.save
      render json: @api_v1_veiculo, status: :created
    else
      render json: @api_v1_veiculo.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/veiculos/1
  def update
    if @api_v1_veiculo.update(api_v1_veiculo_params)
      render json: @api_v1_veiculo
    else
      render json: @api_v1_veiculo.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/veiculos/1
  def destroy
    @api_v1_veiculo.destroy
    render json:"Veículo removido com sucesso"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_veiculo
      @api_v1_veiculo = Veiculo.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def api_v1_veiculo_params
      params.fetch(:veiculo, {}).permit!
    end
end
