class HomeController < ApplicationController
  def sitemap
    respond_to do |format|
      format.xml { render file: 'public/sitemaps/sitemap.xml'  }
      format.html { redirect_to root_url  }
    end
  end
  def catalog_pdf
    send_file(
      "#{Rails.root}/public/indiano_2015.pdf",
      filename: "indiano_2015.pdf",
      type: "application/pdf"
    )
  end
end
