require_relative '../lib/convertor.v3.rb'

describe 'Converter' do
  it 'test whole script' do
    allow(self).to receive(:download_all) do
      file = File.new(File.join(Dir.pwd,'spec/stuff','doc1.xml'), 'w')
      file.close

    end

    #%x[ruby converter.v3.rb 'http://example.file']

    run

    expect(self).to have_received(:download_all).once

    expect(File.exist?(File.join(Dir.pwd,'spec/stuff','doc1.xml'))).to eq true

  end

  context 'can download all documents' do
    #download_all_document(url)
    it 'download 1 doc' do
      expect(Dir[File.join(Dir.pwd,'spec/stuff','**','*')].count{ |file| File.file? file }).to eq 1
    end

  end

end

#add erase directory with xml result

