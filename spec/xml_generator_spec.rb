require 'spec_helper'
require 'convertor.v3.rb'

describe 'Generation xml' do
  it 'purple morning of december' do
    xml_structure_origin_path = File.join(Dir.pwd,'spec/stuff/converted/','structure_sample.xml')
    xml_structure_file = File.open(xml_structure_origin_path,'r')
    xml_example_file = Nokogiri::XML xml_structure_file

    xml_generated_file = generate_xml.doc

    expect(xml_generated_file).to be_equivalent_to xml_example_file

  end

end

