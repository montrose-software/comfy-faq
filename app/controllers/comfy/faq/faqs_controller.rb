class Comfy::Faq::FaqsController < ApplicationController
  layout :set_faq_layout
  before_filter :load_faq

  def show
  end

  protected

  def load_faq
    @faq = Comfy::Faq::Faq.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    raise ActionController::RoutingError.new('Faq Not Found')
  end

  def set_faq_layout
    @faq.app_layout
  end
end
