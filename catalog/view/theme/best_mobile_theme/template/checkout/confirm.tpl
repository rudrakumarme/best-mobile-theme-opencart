<?php if (!isset($redirect)) { ?>
<div class="product-section">
  <div id="payment-confirm-wrapper">
  <?php echo $payment; ?>
  </div>
  <?php } else { ?>
  <script type="text/javascript"><!--
  location = '<?php echo $redirect; ?>';
  //--></script>
  <?php } ?>
</div>
