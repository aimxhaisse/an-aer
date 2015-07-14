module Jekyll
  module AerMetadataFilter
    def aer_metadata(input)
      table = "<table><tbody>"
      input.each do |item|
        table << "<tr><td>" << item.keys[0].capitalize << "</td><td>" << item.values[0].capitalize << "</td></tr>"
      end
      table << "</tbody></table>"
    end
  end
end

Liquid::Template.register_filter(Jekyll::AerMetadataFilter)
