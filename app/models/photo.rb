class Photo < ApplicationRecord
  HOST = 'http://olbg8m6jw.bkt.clouddn.com/'

  def url(crop = '')
    [Photo::HOST, key].join
  end
end
