RSpec.describe SMSApi::Validators::MessageBodyValidator do
  describe '#valid_body?' do
    context 'invalid' do
      it 'when empty' do
        result = described_class.valid_body?('')
        expect(result).to be(false)
      end

      it 'when longer than 918 non special chars' do
        nonspecial = <<-NORMAL_STRING
          @£$¥èéùìòÇØøÅå_^{}[~]|ÆæßÉ!\"#¤%&'()*+,-./0-9:;<=>? ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyzÄÖÑÜ§¿a-zäöñüà
          @£$¥èéùìòÇØøÅå_^{}[~]|ÆæßÉ!\"#¤%&'()*+,-./0-9:;<=>? ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyzÄÖÑÜ§¿a-zäöñüà
          @£$¥èéùìòÇØøÅå_^{}[~]|ÆæßÉ!\"#¤%&'()*+,-./0-9:;<=>? ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyzÄÖÑÜ§¿a-zäöñüà
          @£$¥èéùìòÇØøÅå_^{}[~]|ÆæßÉ!\"#¤%&'()*+,-./0-9:;<=>? ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyzÄÖÑÜ§¿a-zäöñüà
          @£$¥èéùìòÇØøÅå_^{}[~]|ÆæßÉ!\"#¤%&'()*+,-./0-9:;<=>? ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyzÄÖÑÜ§¿a-zäöñüà
          @£$¥èéùìòÇØøÅå_^{}[~]|ÆæßÉ!\"#¤%&'()*+,-./0-9:;<=>? ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyzÄÖÑÜ§¿a-zäöñüà
          @£$¥èéùìòÇØøÅå_^{}[~]|ÆæßÉ!\"#¤%&'()*+,-./0-9:;<=>? ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyzÄÖÑÜ§¿a-zäöñüà
          @£$¥èéùìòÇØøÅå_^{}[~]|ÆæßÉ!\"#¤%&'()*+,-./0-9:;<=>? ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyzÄÖÑÜ§¿a-zäöñüà
        NORMAL_STRING

        expect(nonspecial.length).to be > 918
        result = described_class.valid_body?(nonspecial)
        expect(result).to be(false)
      end

      it 'when longer than 402 special chars' do
        special = <<-SPECIAL_STRING
          ąęółśńćźżąęółśńćźżąęółśńćźżąęółśńćźżąęółśńćźżąęółśńćźżąęółśńćźżąęółśńćźżąęółśńćźżąęółśńćźżąęółśńćźżąęółśńćźżąęółśńćźżąęółśńćźżąęółśńćźżąęółśńćźżąęółśńćźżąęółśńćźżąęół
          ąęółśńćźżąęółśńćźżąęółśńćźżąęółśńćźżąęółśńćźżąęółśńćźżąęółśńćźżąęółśńćźżąęółśńćźżąęółśńćźżąęółśńćźżąęółśńćźżąęółśńćźżąęółśńćźżąęółśńćźżąęółśńćźżąęółśńćźżąęółśńćźżąęół
          ąęółśńćźżąęółśńćźżąęółśńćźżąęółśńćźżąęółśńćźżąęółśńćźżąęółśńćźżąęółśńćźżąęółśńćźżąęółśńćźżąęółśńćźżąęółśńćźżąęółśńćźżąęółśńćźżąęółśńćźżąęółśńćźżąęółśńćźżąęółśńćźżąęół
        SPECIAL_STRING

        expect(special.length).to be > 402
        result = described_class.valid_body?(special)
        expect(result).to be(false)
      end
    end

    context 'double cost chars' do
      it 'when nonspecial chars it cares' do
        tested_msg = ("^{}[]~\|€\n" * 51)
        result     = described_class.valid_body?(tested_msg)

        expect(tested_msg.length).to be <= (918 / 2)
        expect(result).to be(true)
      end

      it 'when nonspecial chars it cares' do
        tested_msg = ("^{}[]~\|€\n" * 52)
        result     = described_class.valid_body?(tested_msg)

        expect(tested_msg.length).to be > (918 / 2)
        expect(result).to be(false)
      end

      it 'when special chars it doesnt care' do
        special_char = 'ą'
        tested_msg = ("#{special_char}^{}[]~\|€\n" * 20)
        result     = described_class.valid_body?(tested_msg)

        expect(tested_msg.length).to be <= (402 / 2)
        expect(result).to be(true)
      end

      it 'when special chars it doesnt care' do
        special_char = 'ą'
        tested_msg = ("#{special_char}^{}[]~\|€\n" * 22)
        result     = described_class.valid_body?(tested_msg)

        expect(tested_msg.length).to be > (402 / 2)
        expect(tested_msg.length).to be < 402
        expect(result).to be(true)
      end
    end

    context 'valid' do
      it 'when non-empty' do
        result = described_class.valid_body?('Test')
        expect(result).to be(true)
      end

      it 'when no longer than 918 ascii chars' do
        nonspecial = <<-NORMAL_STRING
          @£$¥èéùìòÇØøÅå_^{}[~]|ÆæßÉ!\"#¤%&'()*+,-./0-9:;<=>? ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyzÄÖÑÜ§¿a-zäöñüà
        NORMAL_STRING

        expect(nonspecial.length).to be <= 918
        result = described_class.valid_body?(nonspecial)
        expect(result).to be(true)
      end

      it 'when no longer than 402 special chars' do
        special = <<-SPECIAL_STRING
          ąęółśńćźżąęółśńćźżąęółśńćźżąęółśńćźżąęółśńćźżąęółśńćźżąęółśńćźżąęółśńćźżąęółśńćźżąęółśńćźżąęółśńćźżąęółśńćźżąęółśńćźżąęółśńćźżąęółśńćźżąęółśńćźżąęółśńćźżąęółśńćźżąęół
        SPECIAL_STRING

        expect(special.length).to be < 402
        result = described_class.valid_body?(special)
        expect(result).to be(true)
      end
    end
  end
end
