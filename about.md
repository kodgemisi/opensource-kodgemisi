---
layout: page
title: About
permalink: /about/
---

{% for app in site.data.application %}
<div class="col-lg-4 col-md-6">
    <div class="ribbon-wrapper card">
        {% type_ribbon {{app.type}} %}
        {% tech_ribbon {{app.tech}} %}
        <div class="el-card-item">
            <div class="el-card-avatar el-overlay-1"> <img src="https://raw.githubusercontent.com/kodgemisi/better-error-pages-spring-boot-starter/master/docs/screenshot.png" alt="user" />
            </div>
            <div class="el-card-content">
                <h3 class="box-title">{{app.title}}</h3> <small>{{app.description}}</small>
                <br/>
                <div class="m-t-5">
                    {% for url in app.urls %}
                        <!-- mdi-presentation-play -->
                        <i class="mdi mdi-github-circle {{url.type}}"></i>
                        <a href="{{url.link}}">{{url.text}}</a>
                    {% endfor %}
                </div>
            </div>
        </div>
    </div>
</div>
{% endfor %}