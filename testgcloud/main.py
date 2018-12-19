from gcloud import storage

client = storage.Client()

bucket = client.get_bucket('alexcomp')

monfichier = 'main.py'
blob = bucket.blob('%s/%s' % ('mondir', monfichier))

# Uploading string of text
# blob.upload_from_string('this is test content!')

blob.upload_from_filename(monfichier)

#make it public
blob.make_public()

url = blob.public_url

print("L'url public est %s" %(url))

