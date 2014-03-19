class Admin::Cms::Faq::FaqsController < Admin::Cms::Faq::BaseController
  before_filter :build_faq,  only: [:new, :create]
  before_filter :load_faq,   only: [:edit, :update, :destroy]

  def index
    @faqs = @site.faqs.page(params[:page])
  end

  def new
  end

  def edit
    debugger
    p 1
  end

  def create
    @faq.save!
    flash[:success] = 'Faq created'
    redirect_to action: :edit, id: @faq
  rescue ActiveRecord::RecordInvalid
    flash.now[:error] = 'Failed to create Faq'
    render action: :new
  end

  def update
    @faq.update_attributes!(faq_params)
    flash[:success] = 'Faq updated'
    redirect_to action: :edit, id: @faq
  rescue ActiveRecord::RecordInvalid
    flash.now[:error] = 'Failed to update Faq'
    render action: :edit
  end

  def destroy
    @faq.destroy
    flash[:success] = 'Faq deleted'
    redirect_to action: :index
  end

  protected

  def build_faq
    @faq = @site.faqs.new(faq_params)
  end

  def faq_params
    params.fetch(:faq, {}).permit!
  end
end
