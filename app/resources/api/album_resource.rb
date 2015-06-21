module Api
  class AlbumResource < JSONAPI::Resource
    attributes :artist, :released_on, :title
  end
end
