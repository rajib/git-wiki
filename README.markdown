git-wiki: because who needs cool names when you use git?
========================================================

git-wiki is a wiki that relies on git to keep pages' history
and [Sinatra][] to serve them.

Install
-------

The fellowing [gems][] are required to run git-wiki:

- [Sinatra][]
- [mojombo-grit][]
- [HAML][]
- [RDiscount][]

### 1 => `mkdir ~/wiki && (cd ~/wiki && git init)`
### 2 => `cp config.sample.yml config.yml`
### 3 => `bundle`
### 4 => `cd git-wiki && shotgun`

and point your browser at <http://127.0.0.1:9393/>. Enjoy!

  [Sinatra]: http://www.sinatrarb.com
  [mojombo-grit]: http://github.com/mojombo/grit
  [HAML]: http://haml.hamptoncatlin.com
  [RDiscount]: http://github.com/rtomayko/rdiscount
  [WiGit]: http://el-tramo.be/software/wigit
