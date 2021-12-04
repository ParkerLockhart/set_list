require 'rails_helper'

RSpec.describe 'the artists index page' do
  before(:each) do
    @artist = Artist.create!(name: 'Carly Rae Jepsen')
    @artist2 = Artist.create!(name: 'Prince')
    @song = @artist.songs.create!(title: "I Really Like You", length: 208, play_count: 234)
    @song2 = @artist2.songs.create!(title: "Purple Rain", length: 207, play_count: 649)
    @song3 = @artist2.songs.create!(title: "Raspberry Beret", length: 234, play_count: 345)
    visit '/artists'
  end

  it 'shows artists name' do
    expect(page).to have_content(@artist.name && @artist2.name)
  end

end
