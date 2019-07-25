class RawMaterialsController < ApplicationController
  before_action :set_raw_material, only: [:show, :edit, :update, :destroy]

  # GET /raw_materials
  # GET /raw_materials.json
  def index
    @raw_materials = RawMaterial.all
  end

  # GET /raw_materials/1
  # GET /raw_materials/1.json
  def show
  end

  # GET /raw_materials/new
  def new
    @raw_material = RawMaterial.new
  end

  # GET /raw_materials/1/edit
  def edit
  end

  # POST /raw_materials
  # POST /raw_materials.json
  def create
    @raw_material = RawMaterial.new(raw_material_params)

    respond_to do |format|
      if @raw_material.save
        format.html { redirect_to @raw_material, notice: 'Raw material was successfully created.' }
        format.json { render :show, status: :created, location: @raw_material }
      else
        format.html { render :new }
        format.json { render json: @raw_material.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /raw_materials/1
  # PATCH/PUT /raw_materials/1.json
  def update
    respond_to do |format|
      if @raw_material.update(raw_material_params)
        format.html { redirect_to @raw_material, notice: 'Raw material was successfully updated.' }
        format.json { render :show, status: :ok, location: @raw_material }
      else
        format.html { render :edit }
        format.json { render json: @raw_material.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /raw_materials/1
  # DELETE /raw_materials/1.json
  def destroy
    @raw_material.destroy
    respond_to do |format|
      format.html { redirect_to raw_materials_url, notice: 'Raw material was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def add_quantity
    @raw_material = RawMaterial.find(params[:raw_material_id])
    quantity = params[:quantity].to_i
    @raw_material.update_quantity(quantity)

    #  (@raw_material.quantity - quantity) >= 0
    if @raw_material.save
      redirect_to raw_material_path(@raw_material)
    else
      redirect_to edit_raw_material_path(@raw_material)
      flash[:alert] = "Você não pode baixar mais materiais pois não há estoque suficiente"
    end
  end
  
  def sell_opgw_box
    @material_aco = RawMaterial.find_by_name('Aço')
    @material_rosca = RawMaterial.find_by_name('Rosca')
    @material_ferro = RawMaterial.find_by_name('Ferro')
    @material_parafuso = RawMaterial.find_by_name('Parafuso')

    opgw_bm = RawMaterial.get_opgw_box_bm

    update_raw_material(@material_aco, opgw_bm[:aco])
    update_raw_material(@material_rosca, opgw_bm[:rosca])
    update_raw_material(@material_ferro, opgw_bm[:ferro])
    update_raw_material(@material_parafuso, opgw_bm[:parafuso])
    
    if (@material_aco.save && @material_rosca.save && @material_ferro.save && @material_parafuso.save)
      redirect_to raw_materials_path
    else
      redirect_to raw_materials_path
      flash[:alert] = "Você não pode baixar a caixa OPGW pois não há estoque suficiente"
    end
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_raw_material
      @raw_material = RawMaterial.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def raw_material_params
      params.require(:raw_material).permit(:name, :quantity, :log)
    end

    def update_raw_material(material, quantity)
      material.quantity -= quantity
    end
    
end
