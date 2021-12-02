require 'rails_helper'

RSpec.describe 'Artists Songs Index' do
  before(:each) do
    @pantera = Artist.create!(name: 'Pantera')
    @walk = @pantera.songs.create!(title: 'Walk', length: 897, play_count: 923)
    @broken = @pantera.songs.create!(title: 'Im Broken', length: 523, play_count: 729)
    visit "/artists/#{@pantera.id}/songs"
  end

  it 'shows all song titles for the artist' do
    expect(page).to have_content(@walk.title)
    expect(page).to have_content(@broken.title)
  end

  it 'links to each songs show page' do
    click_on @walk.title

    expect(current_path).to eq("/songs/#{@walk.id}")
  end

  it 'shows avg song length for artist' do
    expect(page).to have_content("Average Song Length: 710")
  end
end
