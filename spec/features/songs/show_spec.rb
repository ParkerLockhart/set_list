require 'rails_helper'

RSpec.describe 'the songs show page' do
  before(:each) do
    @artist = Artist.create!(name: 'Carly Rae Jepsen')
    @artist2 = Artist.create!(name: 'Prince')
    @song = @artist.songs.create!(title: "I Really Like You", length: 208, play_count: 234)
    @song2 = @artist2.songs.create!(title: "Purple Rain", length: 207, play_count: 649)
    @song3 = @artist2.songs.create!(title: "Raspberry Beret", length: 234, play_count: 345)
    visit "/songs/#{@song.id}"
  end

  it 'displays song title' do
    expect(page).to have_content(@song.title)
    expect(page).to_not have_content(@song2.title)
  end

  it 'displays artist name for song' do
    expect(page).to have_content(@artist.name)
    expect(page).to_not have_content(@artist2.name)
  end
end
