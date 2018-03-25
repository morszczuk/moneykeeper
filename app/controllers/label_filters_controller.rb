class LabelFiltersController < ApplicationController
  def create
    LabelFilter.new(label_filter_params).save!
    redirect_to root_path
  end

  def destroy
    LabelFilter.find(params[:id]).destroy!
    redirect_to root_path
  end

  private

  def label_filter_params
    params.require(:label_filter).permit(:label)
  end
end

