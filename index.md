---
layout: page
title: Kod Gemisi Open Source
---

<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-body text-center">
                <h1 class="card-title">Kod Gemisi Open Source</h1>
                <h3>We belive in Open Source culture. As a company who uses open source software heavily we share our internal libraries and applications with everyone.</h3>
            </div>
        </div>
    </div>
</div>

<div class="row el-element-overlay">

    {% for app in site.data.application %}
    <div class="col-lg-4 col-md-6">
        <div class="ribbon-wrapper card">
            {% type_ribbon {{app.type}} %}
            {% tech_ribbon {{app.tech}} %}
            <div class="el-card-item">
                <div class="el-card-avatar el-overlay-1">
                    {% if app.image_url == nil %}
                        <img src="https://raw.githubusercontent.com/kodgemisi/better-error-pages-spring-boot-starter/master/docs/screenshot.png" alt="user" />
                    {% else %}
                        <img src="{{app.image_url}}" alt="user" />
                    {% endif %}
                </div>
                <div class="el-card-content">
                    <h3 class="box-title">{{app.title}}</h3> <small>{{app.description}}</small>
                    <br/>
                    <div class="m-t-5">
                        {% for url in app.urls %}
                            {% project_link {{url}} %}
                        {% endfor %}
                    </div>
                </div>
            </div>
        </div>
    </div>
    {% endfor %}

</div>
