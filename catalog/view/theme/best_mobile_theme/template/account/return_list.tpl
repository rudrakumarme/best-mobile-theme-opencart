<?php echo $header; ?>
<div class="container">
  <div class="row">
    <div id="content" class="col-sm-12"><?php echo $content_top; ?>
      <div class="nav-bar breadcrumb"><?php echo $heading_title; ?></div>
      <?php if ($returns) { ?>
      <?php foreach ($returns as $return) { ?>
      <div class="row widget">
        <div class="col-sm-12">
          <div class="return-info-group">
            <div>
              <?php echo $column_return_id; ?>: #<?php echo $return['return_id']; ?>
              <span class="return-status"><?php echo $return['status']; ?></span>
            </div>
            <div><?php echo $column_date_added; ?>: <?php echo $return['date_added']; ?></div>
            <div><?php echo $column_order_id; ?>: <?php echo $return['order_id']; ?></div>
            <div class="pb-0"><?php echo $column_customer; ?>: <?php echo $return['name']; ?></div>
            <a href="<?php echo $return['href']; ?>" data-toggle="tooltip" title="<?php echo $button_view; ?>" class="btn btn-info"><?php echo $button_view; ?></a>
          </div>
        </div>
      </div>
      <?php } ?>
      <div class="col-sm-12 text-center"><?php echo $pagination; ?></div>
      <?php } else { ?>
      <div class="row widget">
        <div class="col-xs-12">
          <div class="no-items">
            <div class="icon"><i class="iconfont">&#xe6a4;</i></div>
            <div class="msg"><?php echo $text_empty; ?></div>
          </div>
        </div>
      </div>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    </div>
</div>
<?php echo $footer; ?>
