require 'rails_helper'

RSpec.describe 'artist edit' do
  before(:each) do
    @artist = Artist.create!(name: 'Carly Rae Jepsen')
    @artist2 = Artist.create!(name: 'Prince')
    @song = @artist.songs.create!(title: "I Really Like You", length: 208, play_count: 234)
    @song2 = @artist2.songs.create!(title: "Purple Rain", length: 207, play_count: 649)
    @song3 = @artist2.songs.create!(title: "Raspberry Beret", length: 234, play_count: 345)
  end

  it 'links to the edit page' do
    visit "/artists/#{@artist.id}"

    click_button "Edit #{@artist.name}"

    expect(current_path).to eq("/artists/#{@artist.id}/edit")
  end

  it 'can edit the artist' do
    @artist3 = Artist.create!(name: 'Brittany Spears')
    visit "artists/#{@artist3.id}/edit"

    fill_in 'Name', with: 'Britney Spears'
    click_button "Update Artist"
    expect(current_path).to eq("/artists/#{@artist3.id}")
    expect(page).to have_content('Britney Spears')
    expect(page).to_not have_content('Brittany Spears')
  end
end
