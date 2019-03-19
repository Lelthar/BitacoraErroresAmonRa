class ProgrammingErrorsController < ApplicationController
  before_action :set_programming_error, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /errors
  # GET /errors.json
  def index
    @programming_errors = ProgrammingError.all
  end

  # GET /errors/1
  # GET /errors/1.json
  def show
  end

  # GET /errors/new
  def new
    @programming_error = ProgrammingError.new
  end

  # GET /errors/1/edit
  def edit
  end

  # POST /errors
  # POST /errors.json
  def create

    @programming_error = current_user.programming_errors.new(programming_error_params)

    respond_to do |format|
      if @programming_error.save
        format.html { redirect_to @programming_error, notice: 'Error was successfully created.' }
        format.json { render :show, status: :created, location: @programming_error }
      else
        format.html { render :new }
        format.json { render json: @programming_error.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /errors/1
  # PATCH/PUT /errors/1.json
  def update
    respond_to do |format|
      if @programming_error.update(programming_error_params)
        format.html { redirect_to @programming_error, notice: 'Error was successfully updated.' }
        format.json { render :show, status: :ok, location: @programming_error }
      else
        format.html { render :edit }
        format.json { render json: @programming_error.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /errors/1
  # DELETE /errors/1.json
  def destroy
    @programming_error.destroy
    respond_to do |format|
      format.html { redirect_to programming_errors_url, notice: 'Error was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_programming_error
      @programming_error = ProgrammingError.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def programming_error_params
      params.require(:programming_error).permit(:title,:code, :message, :cause, :solution, :reference)
    end
end
