describe Link do
  let!(:link) do
    Link.new(original_url: 'https://www.google.co.uk/#q=I+need+a+url+shortener')
  end

  describe '#generate_code' do
    it 'generate a random code with SecureRandom base64' do
      allow(SecureRandom).to receive(:urlsafe_base64).and_return('soy_random')
      link.generate_code
      expect(link.code).to eq('soy_random')
    end
  end
end
