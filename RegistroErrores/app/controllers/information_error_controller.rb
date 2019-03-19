class InformationErrorController < ApplicationController
  def generate_pdf
  	@programming_errors = ProgrammingError.all

    require "prawn/table"
    require "prawn"

    Prawn::Document.generate("information.pdf") do |pdf|
      table_data = Array.new
      table_data << ["Titulo", "Autor"]
      @programming_errors.each do |p|
        table_data << [p.title, p.user.email]
      end
      pdf.table(table_data, :width => 500, :cell_style => { :inline_format => true })
    end

    ApplicationMailer.welcome(current_user.email).deliver

    redirect_to programming_errors_path, notice: 'Pdf was successfully created.' 
  end
end
