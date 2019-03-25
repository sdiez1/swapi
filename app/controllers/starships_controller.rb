require 'httparty'

class StarshipsController < ApplicationController
  include HTTParty
  self.base_uri "https://swapi.co/api/"
  before_action :set_starship, only: [:show, :edit, :update, :destroy]

  # GET /starships
  # GET /starships.json
  def index
    @starships = self.class.get("/starships/")['results']
  end

  # GET /starships/1
  # GET /starships/1.json
  def show
    @starship = self.class.get("/starships/#{params[:id]}")
    @movies = self.class.get("/films/")['results']
    @characters = self.class.get("/people/")['results']
    @planets = self.class.get("/planets/")['results']
    @starships = self.class.get("/starships/")['results']
  end

  # GET /starships/new
  def new
    @starship = Starship.new
  end

  # GET /starships/1/edit
  def edit
  end

  # POST /starships
  # POST /starships.json
  def create
    @starship = Starship.new(starship_params)

    respond_to do |format|
      if @starship.save
        format.html { redirect_to @starship, notice: 'Starship was successfully created.' }
        format.json { render :show, status: :created, location: @starship }
      else
        format.html { render :new }
        format.json { render json: @starship.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /starships/1
  # PATCH/PUT /starships/1.json
  def update
    respond_to do |format|
      if @starship.update(starship_params)
        format.html { redirect_to @starship, notice: 'Starship was successfully updated.' }
        format.json { render :show, status: :ok, location: @starship }
      else
        format.html { render :edit }
        format.json { render json: @starship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /starships/1
  # DELETE /starships/1.json
  def destroy
    @starship.destroy
    respond_to do |format|
      format.html { redirect_to starships_url, notice: 'Starship was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_starship
      @starship = self.class.get("/starships/#{params[:id]}")
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def starship_params
      params.require(:starship).permit(:name, :model, :manufacturer, :cost_in_credits, :length, :max_atmosphering_speed, :crew, :passengers, :cargo_capacity, :consumables, :hyperdrive_rating, :MGLT, :starship_class, :pilots, :films, :url)
    end
end
