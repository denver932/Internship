class DiagnosisItemsController < ApplicationController
  def index
    @diagnosisitems = DiagnosisItem.all
  end

  def create
    @diagnosisitem = DiagnosisItem.new(diagnosisitem_params)
    if @diagnosisitem.save
      redirect_to @diagnosisitem
    else
      render :new
    end
  end

  def show
    @diagnosisitem = DiagnosisItem.find(params[:id])
  end

  def new
    @diagnosisitem = DiagnosisItem.new
  end

  def edit
    @diagnosisitem = DiagnosisItem.find(params[:id])
  end

  def update
    @diagnosisitem = DiagnosisItem.find(params[:id])
    if @diagnosisitem.update(diagnosisitem_params)
      redirect_to @diagnosisitem
    else
      render :edit
    end
  end

  def destroy
    @diagnosisitem = DiagnosisItem.find(params[:id])
    @diagnosisitem.destroy
    redirect_to diagnosisitems_path
  end

  private

    def diagnosisitem_params
      params.require(:diagnosisitem).permit(:patient_id, :physician_id, :content)
    end
end
