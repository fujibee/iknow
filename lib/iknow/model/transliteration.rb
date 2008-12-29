class Iknow::Transliteration < Iknow::Base
  ATTRIBUTES = [:text, :type]
  READONLY_ATTRIBUTES = []
  attr_accessor *(ATTRIBUTES - READONLY_ATTRIBUTES)
  attr_reader *READONLY_ATTRIBUTES
  
  def initialize(params = {})
    @transliteration = params[:transliteration]
    @type            = params[:type]
  end
end
