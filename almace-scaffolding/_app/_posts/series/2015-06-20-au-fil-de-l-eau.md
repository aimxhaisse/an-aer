---
layout: serie
title: Au fil de l'eau
desc: An Aer・Au fil de l'eau
category: series
what: Pyrénées, 2015
plugin: intense
---

<p>
  Une série de photographies en argentique noir et blanc autours de
  ruisseaux, torrent et cascades pyrénéennes.
</p>

{% for post in site.categories.au-fil-de-l-eau %}
<div class="square-box">
  <div class="square-dummy"></div>
  <div class="square-thumb">
    <p>
      <a href="{{ post.url }}">
	<img alt="{{ post.title }}" src="{{ site.file }}/series/{{ post.category }}/{{ post.image }}-medium.jpg" class="nointense" />
      </a>
    </p>
  </div>
</div>
{% endfor %}

