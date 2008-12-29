class Iknow::Format::Base

  def self.create_format(format)
    case format.to_sym
    when :json
      Iknow::Format::Json.new
    when :xml
      Iknow::Format::Xml.new
    end
  end

end
