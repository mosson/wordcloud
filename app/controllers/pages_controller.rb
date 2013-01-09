class PagesController < InheritedResources::Base
  def show
    begin
      @page = Page.find_by_permalink(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to root_url and return
    end

    @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
  end
end
