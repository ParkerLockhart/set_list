require 'rails_helper'

RSpec.describe 'the songs show page' do
  it 'displays song title' do
    artist = Artist.create!(name: 'Carly Rae Jepsen')
    song = artist.songs.create!(title: "I Really Like You", length: 208, play_count: 234)
    song2 = artist.songs.create!(title: "Call Me Maybe", length: 207, play_count: 649)
    visit "/songs/#{song.id}"

    expect(page).to have_content(song.title)
    expect(page).to_not have_content(song2.title)
  end

  it 'displays artist name for song' do
    artist = Artist.create!(name: 'Carly Rae Jepsen')
    song = artist.songs.create!(title: "I Really Like You", length: 208, play_count: 234)
    song2 = artist.songs.create!(title: "Call Me Maybe", length: 207, play_count: 649)

    visit "/songs/#{song.id}"
    save_and_open_page
    expect(page).to have_content(artist.name)
    expect(page).to_not have_content(song2.title)
  end
end
