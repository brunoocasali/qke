module Helpers
  describe DataRepository do
    let(:data_repository) do
      DataRepository.new(path: 'spec/support/data/data.log')
    end

    context 'about directories' do
      it "is valid if it 'data' dir exists" do
        expect(data_repository).to have_data_directory
      end

      it "is invalid if 'data' dir ins't exists" do
        data_repository.path = 'invalid-path/here'

        expect(data_repository).to_not have_data_directory
      end
    end

    context 'about text data file' do
      it 'is valid only with have a .log extension' do
        expect(data_repository).to have_file
      end

      it "is invalid if doesn't have a .log extension" do
        data_repository.path = 'spec/support/data/data.file'

        expect(data_repository).to_not have_file
      end

      it 'is usable if have any text data' do
        data_repository.read

        expect(data_repository.text_data).to_not be_nil
      end
    end

    context 'about text data inside the file' do
      it 'needs to be readed as well' do
        data_repository.read

        data_test = "0:00 ---------------------------------------------\n"

        expect(data_repository.text_data[0]).to eq(data_test)
      end
    end
  end
end
