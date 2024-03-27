<?php if ($error_warning) { ?>
<div class="alert alert-warning"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
<?php } ?>
<?php if ($payment_methods) { ?>
<p><?php echo $text_payment_method; ?></p>
<?php foreach ($payment_methods as $payment_method) { ?>
<div class="smart-radio">
  
    <?php if ($payment_method['code'] == $code || !$code) { ?>
    <?php $code = $payment_method['code']; ?>
    <input id="<?php echo $payment_method['code']; ?>" type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>" checked="checked" />
    <?php } else { ?>
    <input id="<?php echo $payment_method['code']; ?>" type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>" />
    <?php } ?>
	
	<label for="<?php echo $payment_method['code']; ?>"></label>  <?php echo $payment_method['title']; ?>
    <?php if ($payment_method['terms']) { ?>
    (<?php echo $payment_method['terms']; ?>)
    <?php } ?>
  
</div>
<?php } ?>
<?php } ?>
<p><strong><?php echo $text_comments; ?></strong></p>
<p>
  <textarea name="comment" rows="8" class="form-control"><?php echo $comment; ?></textarea>
</p>

<?php if ($text_agree) { ?>
<div class="smart-checkbox">
  
    <input id="pm_agree" type="checkbox" name="agree" value="1" <?php if ($agree) { ?>checked="checked"<?php } ?>/>
    <label for="pm_agree"></label>  <?php echo $text_agree; ?>
</div>
<?php } ?>
<input type="button" value="<?php echo $button_continue; ?>" id="button-payment-method" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary" />
