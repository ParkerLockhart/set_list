require 'rails_helper'

RSpec.describe 'artist creation' do
  before(:each) do
    @artist = Artist.create!(name: 'Carly Rae Jepsen')
    @artist2 = Artist.create!(name: 'Prince')
    @song = @artist.songs.create!(title: "I Really Like You", length: 208, play_count: 234)
    @song2 = @artist2.songs.create!(title: "Purple Rain", length: 207, play_count: 649)
    @song3 = @artist2.songs.create!(title: "Raspberry Beret", length: 234, play_count: 345)
  end

  it 'links to the new page from artist index' do
    visit '/artists'
    click_link("New Artist")

    expect(current_path).to eq('/artists/new')
  end

  it 'can create a new artist' do
    visit '/artists/new'

    fill_in('Name', with: 'Led Zeppelin')
    click_button('Create Artist')

    new_artist_id = Artist.last.id
    expect(current_path).to eq("/artists/#{new_artist_id}")
    expect(page).to have_content('Led Zeppelin')
  end
end
