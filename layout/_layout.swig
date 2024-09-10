<!DOCTYPE html>
<html lang="{{ config.language }}">
<head>
  {{ partial('_partials/head/head.swig', {}, {cache: theme.cache.enable}) }}
  {% include '_partials/head/head-unique.swig' %}
  {{- next_inject('head') }}
  <title>{% block title %}{% endblock %}</title>
  {{ partial('_third-party/analytics/index.swig', {}, {cache: theme.cache.enable}) }}
  {{ partial('_scripts/noscript.swig', {}, {cache: theme.cache.enable}) }}

<!-- 定义全局url常量，用于后续script脚本读取url（解决资源获取问题） -->
<script>
var ROOT_URL="{{ config.root }}"
</script>
<!-- 加载宠物看板 -->
<script>
  var live2d_path = `{{- url_for('/js/live2d-widge/') }}`;
</script>
<script src="{{- url_for('/js/live2d-widge/autoload.js') }}"></script>
<!-- 加载宠物看板 -->
<!-- 个人工具、js信息加载 -->
  {{- next_js('my_utils.js') }}
</head>

<body itemscope itemtype="http://schema.org/WebPage">
  <div class="container{%- if theme.motion.enable %} use-motion{%- endif %}">
    <div class="headband"></div>

    <header class="header" itemscope itemtype="http://schema.org/WPHeader">
<!-- 左上角图片 一般节假日什么的 -->
<img style="width: auto;position: absolute;top: 0;left: 0;z-index: 9999;" src="{{- url_for('/images/739924dd0dc8e2a37f14d6403cf72acd_134x24.png') }}"/>
<!-- 左上角图片 一般节假日什么的 -->

<!--   天气组件   -->
<link type="text/css" rel="stylesheet" href="{{- url_for('/css/wearherWidget.css')}}"/>
<div id="ww_4b54bde5f3d24" v='1.3' loc='auto'
     a='{"t":"responsive","lang":"zh","sl_lpl":1,"ids":[],"font":"Arial","sl_ics":"one_a","sl_sot":"celsius","cl_bkg":"image","cl_font":"#FFFFFF","cl_cloud":"#FFFFFF","cl_persp":"#81D4FA","cl_sun":"#FFC107","cl_moon":"#FFC107","cl_thund":"#FF5722"}'>
  <a href="https://weatherwidget.org/zh/" id="ww_4b54bde5f3d24_u" target="_blank">天气加载中...</a>
</div>
<script async src="{{- url_for('/js/wearherWidget.js?id=ww_4b54bde5f3d24') }}"></script>
<!--   天气组件   -->

      <div class="header-inner">{% include '_partials/header/index.swig' %}</div>
    </header>

    {{ partial('_partials/widgets.swig', {}, {cache: theme.cache.enable}) }}

    <main class="main">
      <div class="main-inner">
        <div class="content-wrap">
          {% include '_partials/header/sub-menu.swig' %}
          <div class="content {% block class %}{% endblock %}">
            {% block content %}{% endblock %}
          </div>
          {% include '_partials/comments.swig' %}
        </div>
        {%- if theme.sidebar.display !== 'remove' %}
          {% block sidebar %}{% endblock %}
        {%- endif %}
      </div>
    </main>

    <footer class="footer">
      <div class="footer-inner">
        {% include '_partials/languages.swig' %}
        {{ partial('_partials/footer.swig', {}, {cache: theme.cache.enable}) }}
        {{ partial('_third-party/statistics/index.swig', {}, {cache: theme.cache.enable}) }}
      </div>
    </footer>
  </div>

  {{ partial('_scripts/index.swig', {}, {cache: theme.cache.enable}) }}
  {{ partial('_third-party/index.swig', {}, {cache: theme.cache.enable}) }}

  {%- if theme.pjax %}
    <div id="pjax">
  {%- endif %}
  {% include '_third-party/math/index.swig' %}
  {% include '_third-party/quicklink.swig' %}

  {{- next_inject('bodyEnd') }}
  {%- if theme.pjax %}
    </div>
  {%- endif %}
</body>
</html>
