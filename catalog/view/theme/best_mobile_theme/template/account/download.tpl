<?php echo $header; ?>
<div class="container">
  <div class="row">
    <div id="content" class="col-sm-12"><?php echo $content_top; ?>
      <div class="nav-bar breadcrumb"><?php echo $heading_title; ?></div>
      <div class="row widget">
        <div class="col-xs-12">
          <?php if ($downloads) { ?>
          <table class="table table-bordered table-hover">
            <thead>
              <tr>
                <td class="text-right"><?php echo $column_order_id; ?></td>
                <td class="text-left"><?php echo $column_name; ?></td>
                <td class="text-left"><?php echo $column_size; ?></td>
                <td class="text-left"><?php echo $column_date_added; ?></td>
                <td></td>
              </tr>
            </thead>
            <tbody>
              <?php foreach ($downloads as $download) { ?>
              <tr>
                <td class="text-right"><?php echo $download['order_id']; ?></td>
                <td class="text-left"><?php echo $download['name']; ?></td>
                <td class="text-left"><?php echo $download['size']; ?></td>
                <td class="text-left"><?php echo $download['date_added']; ?></td>
                <td><a href="<?php echo $download['href']; ?>" data-toggle="tooltip" title="<?php echo $button_download; ?>" class="btn btn-primary"><i class="fa fa-cloud-download"></i></a></td>
              </tr>
              <?php } ?>
            </tbody>
          </table>
          <div class="row">
            <div class="col-sm-12 text-center"><?php echo $pagination; ?></div>
          </div>
          <?php } else { ?>
          <div class="no-items">
            <div class="icon"><i class="iconfont">&#xe606;</i></div>
            <div class="msg"><?php echo $text_empty; ?></div>
          </div>
          <?php } ?>
        </div>
      </div>
      <?php echo $content_bottom; ?></div>
    </div>
</div>
<?php echo $footer; ?>
