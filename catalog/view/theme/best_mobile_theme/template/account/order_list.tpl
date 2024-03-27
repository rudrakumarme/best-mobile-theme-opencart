<?php echo $header; ?>
<div class="container">

<div class="nav-bar breadcrumb"><?php echo $heading_title; ?></div>
  <div class="row widget">
    <div id="content" class="col-sm-12"><?php echo $content_top; ?>
      

      <?php if ($orders) { ?>
      <div class="table-responsive">
        <table class="table table-bordered table-hover">
          <thead>
            <tr>
              <td class="text-right"><?php echo $column_order_id; ?></td>
              <td class="text-left"><?php echo $column_customer; ?></td>
              <td class="text-right"><?php echo $column_product; ?></td>
              <td class="text-left"><?php echo $column_status; ?></td>
              <td class="text-right"><?php echo $column_total; ?></td>
              <td class="text-left"><?php echo $column_date_added; ?></td>
              <td></td>
            </tr>
          </thead>
          <tbody>
            <?php foreach ($orders as $order) { ?>
            <tr>
              <td class="text-right">#<?php echo $order['order_id']; ?></td>
              <td class="text-left"><?php echo $order['name']; ?></td>
              <td class="text-right"><?php echo $order['products']; ?></td>
              <td class="text-left"><?php echo $order['status']; ?></td>
              <td class="text-right"><?php echo $order['total']; ?></td>
              <td class="text-left"><?php echo $order['date_added']; ?></td>
              <td class="text-right"><a href="<?php echo $order['view']; ?>" data-toggle="tooltip" title="<?php echo $button_view; ?>" class="btn btn-info"><i class="fa fa-eye"></i></a></td>
            </tr>
            <?php } ?>
          </tbody>
        </table>
      </div>
      <div class="col-sm-12 text-center"><?php echo $pagination; ?></div>
      <?php } else { ?>
      <div class="row widget">
        <div class="col-xs-12">
          <div class="no-items">
            <div class="icon"><i class="iconfont">&#xe61a;</i></div>
            <div class="msg"><?php echo $text_empty; ?></div>
            <a class="btn btn-primary btn-block" href="<?php echo $home; ?>"><?php echo $button_continue; ?></a>
          </div>
        </div>
      </div>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    </div>
</div>
<?php echo $footer; ?>
