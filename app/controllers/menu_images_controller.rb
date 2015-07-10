class MenuImagesController < ApplicationController
  def destroy
    @menu = Menu.find(params[:menu_id])
    @photo = @menu.menu_images.find(params[:id])
    @photo.destroy
    redirect_to menu_path(@menu)
  end
end
