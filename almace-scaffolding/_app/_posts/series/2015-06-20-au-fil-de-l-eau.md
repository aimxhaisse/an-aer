---
layout: serie
title: Au fil de l'eau
desc: An Aer・Au fil de l'eau
category: series
what: Pyrénées, 2015
---

<article>
  <p>
    Une série de photographies en argentique noir et blanc autours de
    ruisseaux, torrent et cascades pyrénéennes.
  </p>
    <div class="quick-preview cf">
    {% for post in site.categories.au-fil-de-l-eau %}
    <a href="{{ post.url }}">
      <img class="intense" src="{{ site.file }}/series/{{ post.category }}/{{ post.image }}-small.jpg" />
    </a>
    {% endfor %}
  </div>
</article>

