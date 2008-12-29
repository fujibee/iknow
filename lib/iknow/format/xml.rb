require 'rexml/document'

class Iknow::Format::Xml < Iknow::Format::Base

  def mime_type; 'text/xml' end

  def to_sym; :xml end

  def handle_response(xml_response)
    doc = REXML::Document.new(xml_response)
    hash = []
    doc.root.elements.each do |e| # TODO need to fetch first significant element
      hash = extract_xml_to_hash(e)
    end
    hash
  end

  private

  def extract_xml_to_hash(parent)
    if has_children_same_element_name? parent
      arr = []
      parent.elements.each do |c|
        arr << extract_xml_to_hash(c) 
      end
      return arr
    else
      hash = {}
      hash[parent.name] = parent.text unless parent.elements.size > 0
      parent.elements.each do |c|
        hash[c.name] = c.elements.size > 0 ? extract_xml_to_hash(c) : c.text
      end
      parent.attributes.each do |name, value|
        hash[name] = value
      end
      return hash
    end
  end
   
  def has_children_same_element_name?(parent)
    parent.name.reverse.slice(0, 1) == 's' # last letter
  end

end

