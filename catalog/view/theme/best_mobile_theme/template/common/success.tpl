<?php echo $header; ?>
<div class="container">
  <div class="row">
    <div id="content" class="col-xs-12">
      <div class="nav-bar breadcrumb"><?php echo $heading_title; ?></div>
      <div class="row widget">
        <div class="col-xs-12">
          <div class="success-icon">
            <i class="iconfont">&#xe61f;</i>
          </div>
          <div class="success-message">
            <?php echo $text_message; ?>
          </div>
          <a href="<?php echo $continue; ?>" class="btn btn-primary btn-block"><?php echo $button_continue; ?></a>
        </div>
      </div>
      <?php echo $content_bottom; ?></div>
    </div>
</div>
<?php echo $footer; ?>
