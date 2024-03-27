<?php echo $header; ?>
<div class="container">
  <div class="row">
    <div id="content" class="col-xs-12"><?php echo $content_top; ?>
      <div class="nav-bar breadcrumb"><?php echo $heading_title; ?></div>
      <div class="row widget">
        <div class="col-xs-12">
          <div class="table-responsive">
            <table class="table table-bordered table-hover">
              <thead>
                <tr>
                  <td class="text-left" colspan="2"><?php echo $text_recurring_detail; ?></td>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td class="text-left" style="width: 50%;"><b><?php echo $text_order_recurring_id; ?></b> #<?php echo $order_recurring_id; ?><br />
                    <b><?php echo $text_date_added; ?></b> <?php echo $date_added; ?><br />
                    <b><?php echo $text_status; ?></b> <?php echo $status; ?><br />
                    <b><?php echo $text_payment_method; ?></b> <?php echo $payment_method; ?></td>
                  <td class="text-left" style="width: 50%;"><b><?php echo $text_order_id; ?></b> <a href="<?php echo $order; ?>">#<?php echo $order_id; ?></a><br />
                    <b><?php echo $text_product; ?></b> <a href="<?php echo $product; ?>"><?php echo $product_name; ?></a><br />
                    <b><?php echo $text_quantity; ?></b> <?php echo $product_quantity; ?></td>
                </tr>
              </tbody>
            </table>
            <table class="table table-bordered table-hover">
              <thead>
                <tr>
                  <td class="text-left"><?php echo $text_description; ?></td>
                  <td class="text-left"><?php echo $text_reference; ?></td>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td class="text-left" style="width: 50%;"><?php echo $recurring_description; ?></td>
                  <td class="text-left" style="width: 50%;"><?php echo $reference; ?></td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
      <div class="row widget">
        <div class="col-xs-12">
          <h3><?php echo $text_transaction; ?></h3>
          <div class="table-responsive">
            <table class="table table-bordered table-hover">
              <thead>
                <tr>
                  <td class="text-left"><?php echo $column_date_added; ?></td>
                  <td class="text-left"><?php echo $column_type; ?></td>
                  <td class="text-right"><?php echo $column_amount; ?></td>
                </tr>
              </thead>
              <tbody>
                <?php if ($transactions) { ?>
                <?php foreach ($transactions as $transaction) { ?>
                <tr>
                  <td class="text-left"><?php echo $transaction['date_added']; ?></td>
                  <td class="text-left"><?php echo $transaction['type']; ?></td>
                  <td class="text-right"><?php echo $transaction['amount']; ?></td>
                </tr>
                <?php } ?>
                <?php } else { ?>
                <tr>
                  <td colspan="3" class="text-center"><?php echo $text_no_results; ?></td>
                </tr>
                <?php } ?>
              </tbody>
            </table>
          </div>
        </div>
      </div>
      <?php echo $recurring; ?>
      <?php echo $content_bottom; ?></div>
  </div>
</div>
<?php echo $footer; ?>
