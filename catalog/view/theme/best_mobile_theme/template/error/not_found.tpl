<?php echo $header; ?>
<div class="container">
  <div class="row">
    <div id="content" class="col-xs-12"><?php echo $content_top; ?>
      <div class="nav-bar breadcrumb"><?php echo $heading_title; ?></div>
      <div class="row widget error-widget">
        <div class="col-xs-12">
          <p><?php echo $text_error; ?></p>
        </div>
      </div>
      <div class="buttons">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php echo $content_bottom; ?>
    </div>
  </div>
</div>
<?php echo $footer; ?>
