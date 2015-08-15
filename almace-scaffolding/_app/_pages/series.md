---
layout: page
title: Séries d'Images
permalink: /series/
desc: An Aer・Séries d'Images
category: image
---

<div id="series">
  {% for post in site.categories.series %}
  <div class="serie-box cf">
    <div class="serie-image">
      <a href="{{ post.url }}">
	      <img alt="{{ post.title }}" src="{{ site.file }}/series/{{ post.target }}/{{ post.star }}/300x225.jpg" class="nointense" />
      </a>
    </div>
    <div class="serie-meta">
      <a href="{{ post.url }}">{{ post.title }}</a> ({{ post.what }})
      <p>
        {{ post.long }}
      </p>
    </div>
  </div>
  {% endfor %}
</div>
