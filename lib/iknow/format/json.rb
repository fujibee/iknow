class Iknow::Format::Json < Iknow::Format::Base

  def mime_type; 'text/x-json' end

  def to_sym; :json end

end

