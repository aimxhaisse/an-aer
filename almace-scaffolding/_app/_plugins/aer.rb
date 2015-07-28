module Jekyll
  module AerMetadataFilter
    def aer_metadata(input)
      table = "<table><tbody>"
      input.each do |item|
        table << "<tr><td>" << item.keys[0].to_s.capitalize << "</td><td>" << item.values[0].to_s << "</td></tr>"
      end
      table << "</tbody></table>"
    end
  end
end

Liquid::Template.register_filter(Jekyll::AerMetadataFilter)
