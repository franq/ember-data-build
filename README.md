Ember Data Custom Build
==========

Clone this repo into the root of an ember-data clone:

```
git clone git@github.com:emberjs/data.git ember-data \
  && cd ember-data \
  && npm install \
  && git clone git@github.com:franq/ember-data-build.git builds
```

When you want to create a custom build:

```
# choose an appropriate version number
version="1.0.0-beta.12b"
cd builds \
  && ./bin/update.sh $version \
  && git push --tags
```
