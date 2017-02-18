class Photo < ApplicationRecord
  HOST = 'http://upload.fireflybaby.cn/'

  def url(crop = '')
    [Photo::HOST, key].join
  end
end
