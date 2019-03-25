# opensource.kodgemisi.com

The site is served here [opensource.kodgemisi.com](https://opensource.kodgemisi.com/).

`commitId` in build info in footer `<footer build="commitId@ISO-timestamp">` shows a commit from `Jekyll` branch not the `master` branch.

# Preparing development environment

```
# You need to install rvm: https://rvm.io/rvm/install
rvm use 2.6
bundle install
bundle exec jekyll serve
```

# Deploying to production

```
# You need to install rvm: https://rvm.io/rvm/install
rvm use 2.6
bundle install
./publi.sh
```

### Development resources

* [Jekyll Docs](https://jekyllrb.com/docs/variables/)
* Using [jekyll-asset-pipeline](https://github.com/matthodan/jekyll-asset-pipeline)
* [Theme](https://wrappixel.com/demos/admin-templates/material-pro/material/icon-material.html)
