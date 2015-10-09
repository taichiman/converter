require 'convertor.v3'

STUFF_DIR  = File.join(Dir.pwd,'spec/stuff')

describe 'Converter script' do
  context 'the script test' do
    it 'test main workflow' do
      allow(self).to receive(:download_all) do
        file = File.new(File.join(STUFF_DIR,'doc1.xml'), 'w')
        file.close
      end

      run

      expect(self).to have_received(:download_all).once
      expect(File.exist?(File.join(STUFF_DIR,'doc1.xml'))).to eq true

    end
  end

end

describe 'test downloading' do
  context 'can download all documents' do
    #download_all_document(url)
    it 'download 1 doc' do
      expect(Dir[File.join(STUFF_DIR,'**','*')].count{ |file| File.file? file }).to eq 1
    end

  end

end

#add erase directory with xml result

