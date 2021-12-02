require 'rails_helper'

RSpec.describe Artist do
  it {should have_many :songs}

  describe 'instance methods' do
    describe '#average_song_length' do
      before(:each) do
        @pantera = Artist.create!(name: 'Pantera')
        @walk = @pantera.songs.create!(title: 'Walk', length: 897, play_count: 923)
        @broken = @pantera.songs.create!(title: 'Im Broken', length: 523, play_count: 729)
      end

      it 'returns average song length' do
        expect(@pantera.average_song_length).to eq(710)
      end
    end
  end
end
