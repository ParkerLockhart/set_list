require 'rails_helper'

RSpec.describe 'the artists show page' do
  before(:each) do
    @artist = Artist.create!(name: 'Carly Rae Jepsen')
    @artist2 = Artist.create!(name: 'Prince')
    @song = @artist.songs.create!(title: "I Really Like You", length: 208, play_count: 234)
    @song2 = @artist2.songs.create!(title: "Purple Rain", length: 207, play_count: 649)
    @song3 = @artist2.songs.create!(title: "Raspberry Beret", length: 234, play_count: 345)
    visit "/artists/#{@artist.id}"
  end

  it 'displays artist name' do
    expect(page).to have_content(@artist.name)
    expect(page).to_not have_content(@artist2.name)
  end

  it 'displays artist number of songs' do
    expect(page).to have_content(@artist.songs.count)
  end

  it 'displays artist average song length' do
    expect(page).to have_content(@artist.average_song_length)
  end
end
