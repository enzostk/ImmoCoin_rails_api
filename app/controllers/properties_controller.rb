class PropertiesController < ApplicationController
  before_action :set_property, only: %i[ show update destroy ]

  # GET /properties
  def index
    @properties = Property.all

    render json: @properties.as_json(include: :user)
  end

  # GET /properties/1
  def show
    render json: @property.as_json(include: :user)
  end

  # POST /properties
  def create
    @property = Property.new(property_params)
    @property.user = current_user
   
    if @property.save
      render json: @property, status: :created, location: @property
    else
      render json: @property.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /properties/1
  def update
    if @property.update(property_params)
      render json: @property
    else
      render json: @property.errors, status: :unprocessable_entity
    end
  end

  # DELETE /properties/1
  def destroy
    @property_users = PropertyUser.all
    if current_user == @property.user

    property_user = @property_users.find_by(property_id: @property.id)
    property_user.destroy
    @property.destroy 
    else 
      render json: @property.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def property_params
      params.require(:property).permit(:title, :price, :description, :surface)
    end
end
