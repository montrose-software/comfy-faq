class Comfy::Admin::Faq::CategoriesController < Comfy::Admin::Faq::BaseController
  before_filter :load_faq
  before_filter :build_category, only: [:new, :create]
  before_filter :load_category,  only: [:edit, :update, :destroy, :move_lower, :move_higher]

  def index
    @categories = @faq.categories.order(:title).page(params[:page])
  end

  def new
  end

  def create
    @category.save!
    flash[:success] = 'Faq Category created'
    redirect_to comfy_admin_faq_categories_path
  rescue ActiveRecord::RecordInvalid
    flash.now[:error] = 'Failed to create Faq Category'
    render action: :new
  end

  def edit
  end

  def update
    @category.update_attributes!(category_params)
    flash[:success] = 'Faq Category updated'
    redirect_to comfy_admin_faq_categories_path
  rescue ActiveRecord::RecordInvalid
    flash.now[:error] = 'Failed to update Faq Category'
    render action: :edit
  end

  def destroy
    @category.destroy
    flash[:success] = 'Faq Category removed'
    redirect_to comfy_admin_faq_categories_path
  end

  def move_lower
    @category.move_lower
    redirect_to comfy_admin_faq_categories_path
  end

  def move_higher
    @category.move_higher
    redirect_to comfy_admin_faq_categories_path
  end

  protected

  def load_category
    @category = @faq.categories.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:error] = 'Faq Category not found'
    redirect_to action: :index
  end

  def build_category
    @category = @faq.categories.new(category_params)
  end

  def category_params
    params.fetch(:category, {}).permit!
  end
end
