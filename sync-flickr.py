#!/usr/bin/env python2

import os
import frontmatter
import flickrapi
import json
import requests

tmp_file='/tmp/flickr.jpg'
api_key=os.environ['FLICKR_KEY']
api_secret=os.environ['FLICKR_SECRET']
user_id='133795382@N04'

flickr=flickrapi.FlickrAPI(api_key, api_secret)
flickr.authenticate_via_browser(perms='write')
images=json.loads(flickr.photos.search(user_id=user_id, format='json').decode('utf-8'))


def photo_exists(title):
    for photo in images['photos']['photo']:
        if photo['title'] == title:
            return True
    return False


def sync_photo(url, title, desc):
    if photo_exists(title):
        return
    with open(tmp_file, 'wb') as handle:
        resp = requests.get(url, stream=True)
        if not resp.ok:
            return
        for chunk in resp.iter_content(4096):
            handle.write(chunk)
    flickr.upload(filename=tmp_file, title=title, is_public=0, description=desc)


def main():
    for root, subdirs, files in os.walk('almace-scaffolding/_app/_posts/series'):
        for file in files:
            path = '{0}/{1}'.format(root, file)
            post = frontmatter.load(path)

            # skip series
            if post['layout'] != 'photo':
                continue

            serie = post['category']
            category = post['desc']
            image = post['image']

            # skip already uploaded files
            if post.get('flickr', None) != 'sync':
                continue

            url = 'http://storage.an-aer.bzh/aer/series/{0}/{1}/large.jpg'.format(serie, image)
            title = u'{0} #{1}'.format(category, image)
            filename = file[11:]
            filename = filename[:-3]
            desc = 'More info about this image at http://an-aer.bzh/{0}/{1}.html'.format(serie, filename)

            sync_photo(url, title, desc)


if __name__ == '__main__':
    main()
