class Comfy::Admin::Faq::BaseController < Comfy::Admin::Cms::BaseController
  protected

  def load_faq
    @faq = @site.faqs.find(params[:faq_id] || params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:error] = 'Faq not found'
    redirect_to comfy_admin_faqs_path(@site)
  end
end
