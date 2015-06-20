module Api
  class AlbumResource < JSONAPI::Resource
    attributes :artist, :title
  end
end
