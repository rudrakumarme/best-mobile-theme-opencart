<div class="row mobile-category-box">
<div class="module-title"><span></span><h2><?php echo $heading_title; ?></h2><span></span></div>
  <?php foreach ($categories as $category) { ?>
    <div class="col-xs-3 category-item">
      <a href="<?php echo $category['href']; ?>"><img src="<?php echo $category['image']; ?>" class="img-responsive" alt=""><?php echo $category['name']; ?></a>
    </div>
  <?php } ?>
</div>
