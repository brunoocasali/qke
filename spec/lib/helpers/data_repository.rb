describe DataRepository do
  let(:data_repository) { DataRepository.new }

  context 'when talked about a directories' do
    it "is valid if it 'data' dir exists" do
      expect(data_repository).to have_data_directory
    end

    it "is invalid if 'data' dir ins't exists" do
      data_repository.path = 'spec/data'

      expect(data_repository).to_not have_data_directory
    end
  end

  context 'when talked about a text data file' do
    it 'is valid only with have a .txt extension' do
      expect(data_repository).to have_file
    end

    it "is invalid if doesn't have a .txt extension" do
      data_repository.path = 'spec/data-test/data.file'

      expect(data_repository).to_not have_file
    end

    it 'is usable if have any text data' do
      data_repository.path = 'spec/data-test/data.txt'
      data_repository.read

      expect(data_repository.text_data).to_not be_nil
    end
  end

  context 'when talked about a text data inside the file' do
    it 'needs to be readed as well' do
      data_repository.path = 'spec/data-test/data.txt'
      data_repository.read

      data_test = "Lorem ipsum dolor sit amet, consectetur adipisicing elit.\n"

      expect(data_repository.text_data[0]).to eq(data_test)
    end
  end
end
