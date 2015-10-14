require 'convertor.v3'

RUN_DIR  = File.join(Dir.pwd,'spec/stuff/run')
ORIGIN_DIR = File.join(Dir.pwd,'spec/stuff/origin')

describe 'Converter script' do
  context 'the script test' do
    before :each do
      FileUtils.rm_r Dir[File.join(RUN_DIR, '*')]

    end

    it 'test main workflow' do
      allow(self).to receive(:download_all) do
        FileUtils.cp(File.join(ORIGIN_DIR,'acta-01-12-julio-25-de-2012.pdf'), RUN_DIR)

      end

      allow(self).to receive(:convert_to_txt) do
        FileUtils.cp(File.join(ORIGIN_DIR,'sample.txt'), RUN_DIR)

      end

      allow(self).to receive(:convert_to_xml) do
        FileUtils.cp(File.join(ORIGIN_DIR,'acta-01-12-julio-25-de-2012.xml'), RUN_DIR)

      end

      run

      expect(self).to have_received(:download_all).once
      expect(File.exist?(File.join(RUN_DIR,'acta-01-12-julio-25-de-2012.pdf'))).to eq true

      expect(self).to have_received(:convert_to_txt).once
      expect(File.exist?(File.join(RUN_DIR,'sample.txt'))).to eq true

      expect(self).to have_received(:convert_to_xml).once
      expect(File.exist?(File.join(RUN_DIR,'acta-01-12-julio-25-de-2012.xml'))).to eq true

    end
  end

end

describe 'test downloading' do
  context 'can download all documents' do
    #download_all_document(url)
    xit 'download 1 doc' do
      expect(Dir[File.join(RUN_DIR,'**','*')].count{ |file| File.file? file }).to eq 1
    end

  end

end

describe 'convert to txt' do
  #it 'convert to txt' do

    ##find - how convert pdf to txt

    #pdf = File.open(File.join(ORIGIN_DIR, 'acta-01-12-julio-25-de-2012.pdf'))
    #txt = convert_to_txt( pdf )

    #expect(txt#context).to eq pdf

  #end

end

