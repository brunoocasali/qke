# frozen_string_literal: true
require 'log_parser'

describe LogParser do
  before do
    class Fake; end

    class FakeRuler < Rules::Rule
      include Helpers::Constants

      def initialize(params = {})
        params[:klass] = Fake
        super(params)
      end
    end
  end

  describe '#initialize' do
    context 'when invalid' do
      it 'need to raise an exception' do
        message = 'There are invalid :rules inside passed array,' \
                  ' please use only Rules::Rule subclasses.'

        expect do
          described_class.new rules: [Fake]
        end.to raise_error(message)
      end
    end

    context 'when valid' do
      it 'need to return true' do
        expect do
          described_class.new rules: [FakeRuler]
        end.to_not raise_error
      end
    end
  end

  describe '#run!' do
    let(:repo) do
      Helpers::DataRepository.new(path: 'spec/support/data/data.log')
    end
    subject { LogParser.new(rules: [FakeRuler], data: repo) }

    let!(:line_1) { "0:00 ---------------------------------------------\n" }
    let!(:line_2) { " 20:40 Fake: 2 ammo_rockets\n" }
    let!(:line_3) { " 20:54 Kill: 1022 2 22: <world> kd I by MODURT\n" }
    let!(:line_4) { " 21:34 Fake: 2 ammo_rockets\n" }

    let!(:ruler_1) { FakeRuler.new(line: line_1) }
    let!(:ruler_2) { FakeRuler.new(line: line_2) }
    let!(:ruler_3) { FakeRuler.new(line: line_3) }
    let!(:ruler_4) { FakeRuler.new(line: line_4) }

    it 'call .new and .process! with parameters' do
      expect(FakeRuler).to receive(:new).with(line: line_1)
        .and_return(ruler_1)

      expect(FakeRuler).to receive(:new).with(line: line_2)
        .and_return(ruler_2)

      expect(FakeRuler).to receive(:new).with(line: line_3)
        .and_return(ruler_3)

      expect(FakeRuler).to receive(:new).with(line: line_4)
        .and_return(ruler_4)

      expect(ruler_1).to receive(:process!)
      expect(ruler_2).to receive(:process!)
      expect(ruler_3).to receive(:process!)
      expect(ruler_4).to receive(:process!)

      subject.run!
    end
  end
end
