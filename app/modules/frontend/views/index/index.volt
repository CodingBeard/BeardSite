{# 
@package: BeardSite
@author: Tim Marshall <Tim@CodingBeard.com>
@copyright: (c) 2015, Tim Marshall
@license: New BSD License
#}
{% extends 'layouts/master.volt' %}

{% block head %}

{% endblock %}

{% block header %}
  {% include "layouts/header.volt" %}
  {% include "layouts/navigation.volt" %}
{% endblock %}

{% block content %}
  <div class="section no-pad-bot" id="index-banner">
    <div class="container">
      <h2 class="header center orange-text">CodingBeard</h2>

      <div class="row center">
        <h5 class="header col s12 light">No stubble, just good code.</h5>
      </div>
      <div class="row center">
        <a href="https://github.com/CodingBeard" class="btn-large orange">Github</a>
      </div>
    </div>
  </div>
  <div class="container">
    <div class="row">
      <div class="col m4 s12">
        <p class="flow-text center">
          <i class="medium mdi-image-timer-auto"></i> <br/>
          My name is Tim <br/>
          I'm a web developer
        </p>
      </div>
      <div class="col m4 s12">
        <p class="flow-text center">
          <i class="medium mdi-editor-format-indent-increase"></i> <br/>
          Programming is a passion <br/>
          logic is fascinating
        </p>
      </div>
      <div class="col m4 s12">
        <p class="flow-text center">
          <i class="medium mdi-communication-chat"></i> <br/>
          Get to know me <br/>
          <a href="{{ url('contact') }}">Contact</a>
        </p>
      </div>
    </div>
    <div class="row">
      <div class="col s12">
        <hr/>
        <h2 class="header center">Projects</h2>
      </div>
    </div>
    <div class="row">
      <div class="col s12">
        <h3>
          <a href="https://github.com/CodingBeard/ZataBase">ZataBase</a>
          <small class="light">2015-current</small>
        </h3>
      </div>
      <div class="col offset-s0 offset-m2">
        <p class="flow-text">
          ZataBase is a relational database engine written in <a href="http://zephir-lang.com">Zephir</a> with an aim to
          offer an object orientated interface to php scripts. I am using test driven development with PHPUnit testing.
          It is currently in its infancy and is a project to learn about relational databases and Zephir, I am doubtful
          it will ever become used by others.
          <br/>
          It is primarily written in <a href="http://zephir-lang.com">Zephir</a>. The source is open.
        </p>
      </div>
    </div>
    <div class="divider"></div>
    <div class="row">
      <div class="col s12">
        <h3>
          <a href="http://phalconskeleton.codingbeard.com">Phalconskeleton</a>
          <small class="light">2015-current</small>
        </h3>
      </div>
      <div class="col offset-s0 offset-m2">
        <p class="flow-text">
          Phalconskeleton is a skeleton application for a multi-module phalcon project. It has a user/permissions
          system, email templating, asset management, form builder,
          content management, navigation manager, and various other plugins.
          <br/>
          It is primarily written in <a href="http://phalconphp.com/en/">Phalcon 2.0</a>. The source is
          <a href="https://github.com/CodingBeard/phalconskeleton">open.</a>
        </p>
      </div>
    </div>
    <div class="divider"></div>
    <div class="row">
      <div class="col s12">
        <h3>
          <a href="https://quidditchuk.org/">
            QuidditchUK
          </a>
          <small class="light">2014-current</small>
        </h3>
      </div>
      <div class="col offset-s0 offset-m2">
        <p class="flow-text">
          QuidditchUK is the web presence of the UK's quidditch association. It delivers news and content; manages
          clubs, teams, members, tournaments, matches and more. It has a complex user management and permissions system.
          <br/>
          It is primarily written in <a href="http://phalconphp.com/en/">Phalcon 2.0</a>. The source is not currently
          open.
        </p>
      </div>
    </div>
    <div class="divider"></div>
    <div class="row">
      <div class="col s12">
        <h3>
          Chess
          <small class="light">2014</small>
        </h3>
      </div>
      <div class="col offset-s0 offset-m2">
        <p class="flow-text">
          A two player chess game, which can calculate possible moves, check, and checkmate. It has some code that was
          working towards an AI player but was never finished.
          I hope to rewrite and host this online with knowledge gained since first creating it. It was the most
          enjoyable project I have worked on
          so far.
          <br/>
          It is primarily written in PHP, the source is not currently open.
        </p>
      </div>
    </div>
    <div class="divider"></div>
    <div class="row">
      <div class="col s12">
        <h3>
          YouthBase
          <small class="light">2013-2014</small>
        </h3>
      </div>
      <div class="col offset-s0 offset-m2">
        <p class="flow-text">
          My first attempt at OOP programming, it was designed with the needs of Close House Hereford to replace their
          administration system. I received mentoring while developing this. It was deployed to a Raspberry Pi but sadly
          was not used due to a lack of support with the staff.
          <br/>
          It is primarily written in PHP, the source is not currently open.
        </p>
      </div>
    </div>
    <div class="divider"></div>
    <div class="row">
      <div class="col s12">
        <h3>
          <a href="https://dl.dropboxusercontent.com/u/197940643/pvmlogger/index.html">
            PvM Drops Logger
          </a>
          <small class="light">2014</small>
        </h3>
      </div>
      <div class="col offset-s0 offset-m2">
        <p class="flow-text">
          As a request from a friend, it is a logging tool for a type of gameplay in Runescape. It accesses public Wikia
          APIs to collect data and stay up to date.
          It is packaged in another open source project which allows for php 'desktop' applications.
          <br/>
          It is primarily written in PHP. The source is available to view.
        </p>
      </div>
    </div>
    <div class="divider"></div>
    <div class="row">
      <div class="col s12">
        <h3>
          <a href="http://clantrack.com/">
            Clantrack
          </a>
          <small class="light">2013-current</small>
        </h3>
      </div>
      <div class="col offset-s0 offset-m2">
        <p class="flow-text">
          Initially the first programming I ever did. It has moved through multiple revisions from procedural PHP to the
          now OOP MVC, and Javascript powered application it is.
          Clantrack is an experience tracker for the online game Runescape. It collects 78 pieces of information per
          hour
          per clanmate (5-500) per clan. It extrapolates from this information historic gains, activity levels, clan
          records, play time, and more.
          It has an attached IRC chat bot which can query the database using multiple commands, query online APIs, do
          unit conversion, and implements a factoid system.
          <br/>
          It is primarily written in <a href="http://phalconphp.com/en/">Phalcon 1.3.1</a>. The source is not currently
          open.
        </p>
      </div>
    </div>
  </div>
{% endblock %}

{% block javascripts %}
  <script type="text/javascript">
    $(function () {

    });
  </script>
{% endblock %}

{% block footer %}
  {% include "layouts/footer.volt" %}
{% endblock %}