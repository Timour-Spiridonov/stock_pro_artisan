class ArtisansController < ApplicationController
  before_action :set_artisan, only: %i[ show edit update destroy ]
  require 'csv'
  # GET /artisans or /artisans.json
  def import
    file = params[:file]
    return redirect_to artisans_path, notice: "Only Csv files " unless file.content_type =='text/csv'
    file=File.open(file)
    csv=CSV.parse(file, headers: true)
   
    csv.each do |row|
      artisan_hash={}
      artisan_hash[:first_name]=row["first_name"] unless artisan_hash[:first_name]
      artisan_hash[:last_name]=row["last_name"] unless  artisan_hash[:last_name]
      artisan_hash[:tjm]=row["tjm"] unless artisan_hash[:tjm]
      artisan_hash[:siret]=row["siret"] unless artisan_hash[:siret]
      artisan_hash[:description]=row["description"] unless  artisan_hash[:description]
      Artisan.create(artisan_hash)
    end
    return redirect_to artisans_path , notice: 'Csv uploader '
  end

  def add
    artisan = Artisan.find(params[:artisan_id])
    skill = Skill.find(params[:skills_id])
    artisan.skills << skill unless artisan.skills.include?(skill)
    return redirect_to artisans_path, notice: 'Ajout de nouvelle compétence'
  end

  def index
    @artisans = Artisan.all
  end

  # GET /artisans/1 or /artisans/1.json
  def show
  end

  # GET /artisans/new
  def new
    @artisan = Artisan.new
  end

  # GET /artisans/1/edit
  def edit
  end

  # POST /artisans or /artisans.json
  def create
    @artisan = Artisan.new(artisan_params)

    respond_to do |format|
      if @artisan.save
        format.html { redirect_to artisan_url(@artisan), notice: "Artisan was successfully created." }
        format.json { render :show, status: :created, location: @artisan }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @artisan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /artisans/1 or /artisans/1.json
  def update
    respond_to do |format|
      if @artisan.update(artisan_params)
        format.html { redirect_to artisan_url(@artisan), notice: "Artisan was successfully updated." }
        format.json { render :show, status: :ok, location: @artisan }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @artisan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /artisans/1 or /artisans/1.json
  def destroy
    @artisan.destroy

    respond_to do |format|
      format.html { redirect_to artisans_url, notice: "Artisan was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artisan
      @artisan = Artisan.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def artisan_params
      params.require(:artisan).permit(:first_name, :last_name, :tjm, :siret, :description)
    end
end
