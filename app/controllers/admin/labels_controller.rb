class Admin::LabelsController < ApplicationController
  def new
    @label = Label.new
  end

  def create
    label = Label.new(label_params)
    if label.save
      flash[:notice] = "レーベルを新規追加しました"
      redirect_to admin_labels_path
    else
      render "new"
    end
  end

  def index
    @labels = Label.all
  end

  def edit
    @label = Label.find(params[:id])
  end

  def update
    label = Label.find(params[:id])
    if label.update(label_params)
      flash[:notice] = "編集が完了しました"
      redirect_to admin_labels_path
    else
      render "edit"
    end
  end

  def destroy
    label = Label.find(params[:id])
    if label.destroy
      flash[:notice] = "削除が完了しました"
      redirect_to admin_labels_path
    else
      render "edit"
    end
  end

  private

  def label_params
    params.require(:label).permit(:label)
  end
end
