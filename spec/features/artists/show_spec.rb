require 'rails_helper'

RSpec.describe 'the artists show page' do
  it 'displays artists name' do
    artist = Artist.create!(name: 'Carly Rae Jepsen')
    artist2 = Artist.create!(name: 'Prince')
    song = artist.songs.create!(title: "I Really Like You", length: 208, play_count: 234)
    song2 = artist.songs.create!(title: "Call Me Maybe", length: 207, play_count: 649)
    visit "/artists/#{artist.id}"

    expect(page).to have_content(artist.name)
    expect(page).to_not have_content(artist2.name)
  end

  xit 'displays artist name for song' do
    artist = Artist.create!(name: 'Carly Rae Jepsen')
    song = artist.songs.create!(title: "I Really Like You", length: 208, play_count: 234)
    song2 = artist.songs.create!(title: "Call Me Maybe", length: 207, play_count: 649)

    visit "/songs/#{song.id}"
    save_and_open_page
    expect(page).to have_content(artist.name)
    expect(page).to_not have_content(song2.title)
  end
end
