<div class="row widget information-widget">
  <div class="col-xs-12">
     <span><i class="iconfont icon-dianhua ">&#xe621;</i><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></span>
      <span><i class="iconfont icon-dingwei ">&#xe624;</i><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></span>
    <ul class="list-unstyled">
      <?php foreach ($informations as $information) { ?>
      <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
      <?php } ?>
    </ul>
  </div>
</div>
