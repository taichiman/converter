def download_all

end

def convert_to_txt

end

def convert_to_xml

end

def generate_xml
  builder = Nokogiri::XML::Builder.new do |xml|
    xml.akomaNtoso {
      xml.debate {
        xml.meta {
          xml.references {
          }
        }

        xml.preface {
          xml.docTitle
          xml.link(href: "")
        }

        xml.debateBody {
          xml.debateSection {
            xml.heading {
            }
          }
        }
      }      
    }

  end

  builder

end

def run
  download_all
  convert_to_txt
  convert_to_xml

end

