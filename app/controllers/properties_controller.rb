# frozen_string_literal: true

class PropertiesController < ApplicationController
  before_action :set_contact
  before_action :set_property, only: %i[show edit update destroy]

  # GET /properties or /properties.json
  def index
    @properties = @contact.properties
  end

  # GET /properties/1 or /properties/1.json
  def show; end

  # GET /properties/new
  def new
    @property = @contact.properties.build
    @property.plants.build
  end

  # GET /properties/1/edit
  def edit; end

  # POST /properties or /properties.json
  def create
    @property = @contact.properties.build(property_params)

    respond_to do |format|
      if @property.save
        format.html { redirect_to [@contact, @property], notice: 'Property was successfully created.' }
        format.json { render :show, status: :created, location: @property }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /properties/1 or /properties/1.json
  def update
    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to @contact, notice: 'Property was successfully updated.' }
        format.json { render :show, status: :ok, location: @property }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /properties/1 or /properties/1.json
  def destroy
    @property.destroy

    respond_to do |format|
      format.html { redirect_to @contact, notice: 'Property was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_contact
    @contact = Contact.find(params[:contact_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_property
    @property = @contact.properties.find(params[:id])
    # @property = Property.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def property_params
    params.require(:property).permit(:name, :plantation_area, :plant_specie, :plants_number,
                                     :plants_row_spacing, :plants_column_spacing,
                                     plants_attributes: %i[id name _destroy])
  end
end
