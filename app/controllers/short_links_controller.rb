class ShortLinksController < ApplicationController
  before_action :set_short_link, only: [:show]

  # GET /short_links/redirect/uid
  def redirect
    # Determine if link is a short link: Redirect to full url if found
    @short_link = ShortLink.find_by(link: request.url)
    if @short_link
      redirect_to @short_link.full_url
    else
      raise ActionController::RoutingError, 'Not Found'
    end
  end

  # GET /short_links/1
  # GET /short_links/1.json
  def show
  end

  # GET /short_links/new
  def new
    @short_link = ShortLink.new
  end

  # POST /short_links
  # POST /short_links.json
  def create
    @short_link = ShortLink.new(short_link_params)

    respond_to do |format|
      if @short_link.save
        format.html { redirect_to @short_link, notice: 'Short link was successfully created.' }
        format.json { render :show, status: :created, location: @short_link }
      else
        format.html { render :new }
        format.json { render json: @short_link.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_short_link
      @short_link = ShortLink.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def short_link_params
      params.require(:short_link).permit(:full_url)
    end
end
