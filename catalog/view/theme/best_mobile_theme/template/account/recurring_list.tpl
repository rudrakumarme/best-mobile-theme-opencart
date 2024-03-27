<?php echo $header; ?>
<div class="container">
  <div class="row">
    <div id="content" class="col-xs-12"><?php echo $content_top; ?>
      <div class="nav-bar breadcrumb"><?php echo $heading_title; ?></div>
      <div class="row widget">
        <div class="col-sm-12">
          <?php if ($recurrings) { ?>
          <div class="table-responsive">
            <table class="table table-bordered table-hover">
              <thead>
                <tr>
                  <td class="text-right"><?php echo $column_order_recurring_id; ?></td>
                  <td class="text-left"><?php echo $column_product; ?></td>
                  <td class="text-left"><?php echo $column_status; ?></td>
                  <td class="text-left"><?php echo $column_date_added; ?></td>
                  <td class="text-right"></td>
                </tr>
              </thead>
              <tbody>
                <?php foreach ($recurrings as $recurring) { ?>
                <tr>
                  <td class="text-right">#<?php echo $recurring['order_recurring_id']; ?></td>
                  <td class="text-left"><?php echo $recurring['product']; ?></td>
                  <td class="text-left"><?php echo $recurring['status']; ?></td>
                  <td class="text-left"><?php echo $recurring['date_added']; ?></td>
                  <td class="text-right"><a href="<?php echo $recurring['view']; ?>" data-toggle="tooltip" title="<?php echo $button_view; ?>" class="btn btn-info"><i class="fa fa-eye"></i></a></td>
                </tr>
                <?php } ?>
              </tbody>
            </table>
          </div>
          <div class="text-right"><?php echo $pagination; ?></div>
          <?php } else { ?>
          <div class="no-items">
            <div class="icon"><i class="iconfont">&#xe69c;</i></div>
            <div class="msg"><?php echo $text_empty; ?></div>
          </div>
          <?php } ?>
        </div>
      </div>
      <?php echo $content_bottom; ?></div>
  </div>
</div>
<?php echo $footer; ?>
