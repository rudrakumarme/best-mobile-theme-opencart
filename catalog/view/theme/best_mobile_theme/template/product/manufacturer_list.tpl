<?php echo $header; ?>
<div class="container">
  <div class="row">
    <div id="content" class="col-xs-12"><?php echo $content_top; ?>
      <!-- <div class="nav-bar breadcrumb"><?php echo $text_manufacturer; ?></div> -->
      <div class="category-manufacturer-switch bottom-border">
        <a href="<?php echo $category; ?>"><?php echo $text_category; ?></a>
        <a href="<?php echo $manufacturer; ?>" class="active"><?php echo $text_manufacturer; ?></a>
      </div>
      <?php if ($categories) { ?>
      <div class="row widget">
        <div class="col-xs-12">
        <?php echo $text_index; ?>
          <?php foreach ($categories as $category) { ?>
          &nbsp;&nbsp;&nbsp;<a href="index.php?route=product/manufacturer#<?php echo $category['name']; ?>"><?php echo $category['name']; ?></a>
          <?php } ?>
        </div>
      </div>
      <?php foreach ($categories as $category) { ?>
      <div class="row widget">
        <h2 id="<?php echo $category['name']; ?>"><?php echo $category['name']; ?></h2>
        <div class="col-xs-12">
          <?php if ($category['manufacturer']) { ?>
          <?php foreach (array_chunk($category['manufacturer'], 4) as $manufacturers) { ?>
          <div class="row">
            <?php foreach ($manufacturers as $manufacturer) { ?>
            <div class="col-xs-3 item"><a href="<?php echo $manufacturer['href']; ?>"><img data-src="<?php echo $manufacturer['image']; ?>" src="<?php echo $placeholder; ?>" class="lazy img-responsive" /><span><?php echo $manufacturer['name']; ?></span></a></div>
            <?php } ?>
          </div>
          <?php } ?>
        </div>
        <?php } ?>
      </div>
      <?php } ?>
      <?php } else { ?>
      <p><?php echo $text_empty; ?></p>
      <div class="buttons clearfix">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>
