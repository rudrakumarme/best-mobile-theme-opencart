<?php echo $header; ?>
<div class="container empty-cart-page">
  <div class="row">
    <div id="content" class="col-xs-12">
      <div class="nav-bar breadcrumb"><?php echo $heading_title; ?></div>
      <?php echo $content_top; ?>
        <div class="row widget">
          <div class="col-sm-12">
            <div class="no-items">
              <span class="icon"><i class="iconfont">&#xe673;</i></span>
              <span class="msg"><?php echo $text_error; ?></span>
              <a class="btn btn-primary btn-block" href="<?php echo $home; ?>"><?php echo $button_continue; ?></a>
            </div>
          </div>
        </div>
      <?php echo $content_bottom; ?>
    </div>
  </div>
</div>
<?php echo $footer; ?>
