class Admin::Cms::Faq::BaseController < CmsAdmin::BaseController
  protected

  def load_faq
    @faq = @site.faqs.find(params[:faq_id] || params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:error] = 'Faq not found'
    redirect_to admin_cms_faqs_path(@site)
  end
end
