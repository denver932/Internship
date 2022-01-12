class DiagnosisItemsController < ApplicationController
  load_and_authorize_resource

  def create
    if @diagnosis_item.save
      redirect_to @diagnosis_item
    else
      render :new
    end
  end

  def new
    @patients = Patient.all
    @physicians = Physician.all
  end

  def edit
    @patients = Patient.all
    @physicians = Physician.all
  end

  def update
    if @diagnosis_item.update(diagnosis_item_params)
      redirect_to @diagnosis_item
    else
      render :edit
    end
  end

  def destroy
    @diagnosis_item.destroy
    redirect_to diagnosis_items_path
  end

  private

  def diagnosis_item_params
    params.require(:diagnosis_item).permit(:patient_id, :physician_id, :content)
  end
end
