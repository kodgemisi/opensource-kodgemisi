---
layout: page
title: About
permalink: /about/
---

{% for app in site.data.application %}
<div class="col-lg-3 col-md-6">
    <div class="card">
        <div class="el-card-item">
            <div class="el-card-avatar el-overlay-1"> <img src="../assets/images/big/img1.jpg" alt="user" />
                <div class="el-overlay">
                    <ul class="el-info">
                        <li><a class="btn default btn-outline image-popup-vertical-fit" href="../assets/images/users/1.jpg"><i class="icon-magnifier"></i></a></li>
                        <li><a class="btn default btn-outline" href="javascript:void(0);"><i class="icon-link"></i></a></li>
                    </ul>
                </div>
            </div>
            <div class="el-card-content">
                <h3 class="box-title">{{app.title}}</h3> <small>{{app.description}}</small>
                <br/> </div>
        </div>
    </div>
</div>
{% endfor %}