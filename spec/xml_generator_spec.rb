require 'spec_helper'
require 'convertor.v3.rb'

require 'tempfile'

describe 'Generation xml' do
  it 'purple morning of december' do
    path = File.join(Dir.pwd,'spec/stuff/converted/','structure_sample.xml')
    xml_example_file = Nokogiri::XML(File.open(path,'r'))
    xml_generated_file = generate_xml.doc

    expect(xml_generated_file).to be_equivalent_to xml_example_file

  end

  it 'add some bit of information' do
    p = File.join(Dir.pwd,'spec/stuff/converted/','title_sample.xml')
    xml1 = Nokogiri::XML(File.open(p,'r'))

    xml2 = generate_xml.doc
    binding.pry 

    Create temp files
    s='foo'
    p `diff "#{s}"`
        
    expect(xml).to be_equivalent_to title_example

  end

end

