require 'rails_helper'

RSpec.describe 'artist destroy' do
  before(:each) do
    @artist = Artist.create!(name: 'Carly Rae Jepsen')
    @artist2 = Artist.create!(name: 'Prince')
    @song = @artist.songs.create!(title: "I Really Like You", length: 208, play_count: 234)
    @song2 = @artist2.songs.create!(title: "Purple Rain", length: 207, play_count: 649)
    @song3 = @artist2.songs.create!(title: "Raspberry Beret", length: 234, play_count: 345)
  end

  it 'can delete artist' do
    @artist3 = Artist.create!(name: 'Britney Spears')
    visit "/artists/#{@artist3.id}"
    click_button 'Delete'
    expect(current_path).to eq("/artists")
    expect(page).to_not have_content('Britney Spears')
  end

end
