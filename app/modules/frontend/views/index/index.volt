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
  <div id="page-top" class="scrollspy"></div>
  {% include "layouts/header.volt" %}
  {% include "layouts/navigation.volt" %}
{% endblock %}

{% block content %}
  <div id="page-top" class="scrollspy">
    <div class="section no-pad-bot" id="index-banner">
      <div class="container">
        <h2 class="header center" style="color: #CBCBC8;">CodingBeard</h2>

        <div class="row center">
          <h5 class="header col s12 light">No stubble, just good code.</h5>
        </div>
        <div class="row center">
          <a href="https://github.com/CodingBeard" class="btn-large" style="background: #6782A0;">Github</a>
        </div>
      </div>
    </div>
  </div>

  <div style="background: #7f7159;">
    <div id="projects" class="section container scrollspy">
      <div class="row">
        <div class="col s12">
          <h2 class="header center white-text">Projects</h2>
        </div>
      </div>
      {% include 'index/partials/index-projects.volt' %}
      {% set size = 6 %}
      {% for key, project in projects %}
        {% if key % 2 == 0 %}
          <div class="row">
          {% if key == projects|length - 1 %}
            {% set size = 12 %}
          {% endif %}
        {% endif %}
        <div class="col s12 l{{ size }}">
          <div class="card">
            <div class="card-content">
              <span class="card-title black-text">{{ project[0] }}</span>

              <p>{{ project[1] }}</p>
            </div>
            <div class="card-action">
              {% if project[2] is iterable %}
                {% for link in project[2] %}
                  {{ link }}
                {% endfor %}
              {% endif %}
              <span class="right grey-text">{{ project[3] }}</span>
            </div>
          </div>
        </div>
        {% if key % 2 != 0 or key == projects|length - 1 %}
          </div>
        {% endif %}
      {% endfor %}
    </div>
  </div>

  <div class="progress no-pad brown" style="margin: 0;">
    <div class="indeterminate grey"></div>
  </div>

  <div style="background: #6782a0;">
    <div id="languages" class="section container scrollspy">
      <div class="row">
        <div class="col s12">
          <h2 class="header center white-text">Languages</h2>
        </div>
      </div>
      {% include 'index/partials/index-languages.volt' %}
      {% set size = 6 %}
      {% for key, language in languages %}
        {% if key % 2 == 0 %}
          <div class="row">
          {% if key == languages|length - 1 %}
            {% set size = 12 %}
          {% endif %}
        {% endif %}
        <div class="col s12 l{{ size }}">
          <div class="card">
            <div class="card-content">
              <span class="card-title black-text">{{ language[0] }}</span>

              <p>{{ language[1] }}</p>
            </div>
          </div>
        </div>
        {% if key % 2 != 0 or key == languages|length - 1 %}
          </div>
        {% endif %}
      {% endfor %}
    </div>
  </div>

  <div class="progress no-pad blue" style="margin: 0;">
    <div class="indeterminate grey"></div>
  </div>

  <div style="background: #cbcbc8;">
    <div id="about-myself" class="section container scrollspy">
      <div class="row">
        <div class="col s12">
          <h2 class="header center white-text">About</h2>
        </div>
      </div>
      <div class="row">
        <div class="col s12 center">
          <img class="responsive-img" src="{{ url('img/beard.png') }}" alt="CodingBeard" style="width: 500px"/>
        </div>
      </div>
      <div class="row">
        <div class="col s12">
          <div class="card">
            <div class="card-content">
              <span class="card-title black-text">Myself</span>

              <p>
                My name is Tim Marshall, I'm a 20 year old Web Developer from the south coast of England. I'm a
                Linux (Ubuntu Gnome) and Android (S3) user as I enjoy getting the most out of everything. I train
                with the South Coast Martial Arts Jujitsu club 2-3 nights a week and use it as a break from the
                virtual world - It's very tangible and keeps my mind completely occupied. I casually game with some
                online games and enjoy the community side of things; hosting my own teamspeak server
                (voice.codingbeard.com). I am currently volunteering for QuidditchUK as their Website Co-Ordinator,
                building, maintaining, and upgrading their website.
                <br/> <br/>
                I'm really passionate about programming, it can keep me occupied for the majority of every day, with
                constant challenges and obstacles to overcome - fascinating logic and algorithms - I love it.
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <div class="progress no-pad white" style="margin: 0;">
    <div class="indeterminate grey"></div>
  </div>

  <div id="contact" class="section container scrollspy">
    <div class="row">
      <div class="col s12">
        <h2 class="header center">Contact</h2>
      </div>
    </div>
    <div id="flash-container">
      {{ flashSession.output() }}
    </div>
    {{ forms.getHtml() }}
  </div>

  <ul class="scroller hide-on-med-and-down">
    <li>
      <a href="#page-top" class="scroll">
        <i class="mdi-editor-vertical-align-top small"></i>
      </a>
    </li>
    <li class="center">
      <a href="#page-top" class="scroll-stop">
        <i class="mdi-toggle-radio-button-off"></i>
      </a>
    </li>
    <li class="center">
      <a href="#projects" class="scroll-stop">
        <i class="mdi-toggle-radio-button-off"></i>
      </a>
    </li>
    <li class="center">
      <a href="#languages" class="scroll-stop">
        <i class="mdi-toggle-radio-button-off"></i>
      </a>
    </li>
    <li class="center">
      <a href="#about-myself" class="scroll-stop">
        <i class="mdi-toggle-radio-button-off"></i>
      </a>
    </li>
    <li class="center">
      <a href="#contact" class="scroll-stop">
        <i class="mdi-toggle-radio-button-off"></i>
      </a>
    </li>
    <li>
      <a href="#contact" class="">
        <i class="mdi-editor-vertical-align-bottom small"></i>
      </a>
    </li>
  </ul>
{% endblock %}

{% block javascripts %}
  <script type="text/javascript">
    $(function () {

      $('.scrollspy').on('scrollSpy:enter', function () {

        $('.scroll-stop[href="#' + $(this).attr('id') + '"] > i')
            .removeClass('mdi-toggle-radio-button-off')
            .addClass('mdi-image-lens');

      }).on('scrollSpy:exit', function () {

        $('.scroll-stop[href="#' + $(this).attr('id') + '"] > i')
            .removeClass('mdi-image-lens')
            .addClass('mdi-toggle-radio-button-off');

      }).scrollSpy();
    });
  </script>
{% endblock %}

{% block footer %}
  {% include "layouts/footer.volt" %}
{% endblock %}