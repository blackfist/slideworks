# Serving reveal.js slides using Phoenix and Elixir
Posted July, 2015
Phoenix version: 0.14.0

A few weeks ago I attended the [Ruby Users of Minnesota](http://ruby.mn) meeting
where  [Ted Naleid](https://twitter.com/tednaleid) gave a talk about the
[Elixir](http://elixir-lang.org/) programming  language and the [Phoenix
framework](http://www.phoenixframework.org/) for developing web applications.
It was an interesting talk about a language that I was unfamiliar with so I
decided to put  more time into exploring the language. One of the problems I ran
into was that the  framework has changed frequently enough that it was difficult
to tell if the various tutorials  on the web were out of date or not. So I had
to back up a bit and start small. Simple  delivery of mostly static content with
a little bit of logic. So we're just going to make a phoenix app that serves up
a reveal.js slide deck and changes the style as specified.

## Create a new project

I'm going to assume that you've already installed elixir and phoenix and go right
into building the project. Fire up a new phoenix project by running `mix phoenix.new slideworks`.

## Get reveal.js

Static assets are served up from the `priv/static` folder. Reveal.js comes with
a lot of stylesheets and scripts that all need to go in that folder, but reveal
doesn't use the same folder names as the folders provided by phoenix. It would
be a lot of work to move everything around and it would break some of the
scripts and stylesheets. So instead we'll start by deleting everything in the
folder. Once the folder is empty, grab the source code for reveal.js from GitHub
by running `git clone https://github.com/hakimel/reveal.js.git`. Now you should
have a bunch of folders and files and we only have to move things around a
little bit.

In a default Phoenix project like we just built, a request for the root of the
application gets routed through the Page Controller and off to the
index.html.eex template. Along the way all of the content from
`web/templates/layout/app.html.eex` is rendered. So purely for the learning,
let's empty out `web/templates/layout/app.html.eex` and take all the content in
`priv/static/index.html` and copy it  into `web/templates/layout/app.html.eex`.

**This next part isn't going to be quite right. Don't go back trying to figure out what went wrong.**

Start the Phoenix server by running `mix phoenix.server` and point your browser at http://localhost:4000/

## Fixing the static assets

So when you visit the page things done look right. It turns out that even though we put all the
files and folders in the static assets folder, not all of them are being served up. You can verify this by looking
at the developer console in Chrome or by looking at the logs that phoenix produces. What's going on?

Well the content of `priv/static` doesn't get served up, only the content which is whitelisted in `lib/slideworks/endpoint.ex`.
Here's a bit of code that shows what will get served up from `priv/static`

```
plug Plug.Static,
  at: "/", from: :slideworks, gzip: false,
  only: ~w(css images js favicon.ico robots.txt)
```

So change the line that says `only:` so that the list also includes `lib` and `plugin`. Now when you go to your app
it should render properly. Yee haw!
