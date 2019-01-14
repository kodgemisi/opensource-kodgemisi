---
layout: page
title: About
permalink: /about/
---

{% for app in site.data.application %}
<div class="col-lg-4 col-md-6">
    <div class="card">
        <div class="el-card-item">
            <div class="el-card-avatar el-overlay-1"> <img src="https://raw.githubusercontent.com/kodgemisi/better-error-pages-spring-boot-starter/master/docs/screenshot.png" alt="user" />
                <div class="el-overlay">
                    <ul class="el-info">
                        <li><a class="btn default btn-outline image-popup-vertical-fit" href="../assets/images/users/1.jpg"><i class="icon-magnifier"></i></a></li>
                        <li><a class="btn default btn-outline" href="javascript:void(0);"><i class="icon-link"></i></a></li>
                    </ul>
                </div>
            </div>
            <div class="el-card-content">
                <h3 class="box-title">{{app.title}}</h3> <small>{{app.description}}</small>
                <br/>
                <div class="m-t-10">
                    {% for tech in app.tech %}
                        <span class="badge badge-pill badge-primary">{{tech}}</span>
                    {% endfor %}
                </div>
                <div class="m-t-15">
                    {% for type in app.type %}
                        <span class="round align-self-center round-info" title="{{type}}"><i class="ti-user"></i></span>
                    {% endfor %}
                </div>
            </div>
        </div>
    </div>
</div>
{% endfor %}