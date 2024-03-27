<?php echo $header; ?>
<div class="container">
  <div class="row">
    <div id="content" class="col-sm-12"><?php echo $content_top; ?>
      <div class="nav-bar breadcrumb"><?php echo $heading_title; ?></div>
      <?php if ($success) { ?>
      <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
        <button type="button" class="close" data-dismiss="alert">&times;</button>
      </div>
      <?php } ?>
      <?php if ($error_warning) { ?>
      <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
        <button type="button" class="close" data-dismiss="alert">&times;</button>
      </div>
      <?php } ?>
      <div class="row widget">
        <div class="col-xs-12">
          <div class="list-two-column-justified">
            <?php if ($invoice_no) { ?>
            <dl>
              <dt><?php echo $text_invoice_no; ?></dt>
              <dd><?php echo $invoice_no; ?></dd>
            </dl>
            <?php } ?>
            <dl>
              <dt><?php echo $text_order_id; ?></dt>
              <dd>#<?php echo $order_id; ?></dd>
            </dl>
            <dl>
              <dt><?php echo $text_date_added; ?></dt>
              <dd><?php echo $date_added; ?></dd>
            </dl>
            <?php if ($payment_method) { ?>
            <dl>
              <dt><?php echo $text_payment_method; ?></dt>
              <dd><?php echo $payment_method; ?></dd>
            </dl>
            <?php } ?>
            <?php if ($shipping_method) { ?>
            <dl>
              <dt><?php echo $text_shipping_method; ?></dt>
              <dd><?php echo $shipping_method; ?></dd>
            </dl>
            <?php } ?>
          </div>
        </div>
      </div>
      <?php if ($shipping_address) { ?>
      <div class="row widget">
        <div class="col-sm-12">
          <strong><?php echo $text_shipping_address; ?></strong> <br/>
          <?php echo $shipping_address; ?>
        </div>
      </div>
      <?php } ?>
      <?php if (!empty($payment)): ?>
        <div class="row widget">
          <div class="col-xs-12">
            <div id="checkout-payment" class="clearfix"><?php echo $payment; ?></div>
          </div>
        </div>
      <?php endif ?>
      <div class="row widget">
        <div class="col-xs-12">
          <?php foreach ($products as $product) { ?>
          <div class="product-item">

            <div class="info">
              <div class="name"><?php echo $product['name']; ?></div>
              <?php if ($product['option']): ?>
              <div class="option">
                <?php foreach ($product['option'] as $option) { ?>
                &nbsp;<?php echo $option['name']; ?>: <?php echo $option['value']; ?>
              <?php } ?>
              </div>
              <?php endif ?>
              <div class="data">
                <div class="model"><b><?php echo $column_model; ?></b>: <?php echo $product['model']; ?></div>
                <div class="total"><?php echo $product['price']; ?> x <?php echo $product['quantity']; ?> = <strong><?php echo $product['total']; ?></strong></div>
              </div>
              <div class="action">
                <?php if ($product['reorder']) { ?>
                <a href="<?php echo $product['reorder']; ?>" class="btn btn-default"><?php echo $button_reorder; ?></a>
                <?php } ?>
                <a href="<?php echo $product['return']; ?>" class="btn btn-default"><?php echo $button_return; ?></a>
              </div>
            </div>
          </div>
          <?php } ?>
          <?php foreach ($vouchers as $voucher) { ?>
          <div class="product-item">
            <div class="name"><?php echo $voucher['description']; ?></div>
            <div class="product-data">
              <div class="total"><?php echo $voucher['amount']; ?> x 1 = <strong><?php echo $voucher['amount']; ?></strong></div>
            </div>
          </div>
          <?php } ?>
        </div>
      </div>
      <div class="row widget">
        <div class="col-xs-12">
          <div class="list-two-column-justified">
            <?php foreach ($totals as $total) { ?>
            <dl>
              <dt><?php echo $total['title']; ?></dt>
              <dd><?php echo $total['text']; ?></dd>
            </dl>
            <?php } ?>
          </div>
        </div>
      </div>
      <?php if ($comment) { ?>
      <div class="row widget">
        <h2><?php echo $text_comment; ?></h2>
        <div class="col-xs-12">
          <?php echo $comment; ?>
        </div>
      </div>
      <?php } ?>
      <?php if ($histories) { ?>
      <div class="row widget">
        <h2><?php echo $text_history; ?></h2>
        <div class="col-xs-12">
          <div class="list-two-column-justified">
            <?php foreach ($histories as $history) { ?>
            <dl><dt><?php echo $column_date_added; ?></dt><dd><?php echo $history['date_added']; ?></dd></dl>
            <dl><dt><?php echo $column_status; ?></dt><dd><?php echo $history['status']; ?></dd></dl>
            <dl><dt><?php echo $column_comment; ?></dt><dd><?php echo $history['comment']; ?></dd></dl>
            <?php } ?>
          </div>
        </div>
      </div>
      <?php } ?>

      <div class="buttons clearfix"></div>
    <?php echo $content_bottom; ?></div>
  </div>
</div>
<?php echo $footer; ?>
