<div class="row">
  <div class="col-sm-6">
    <h2><?php echo $text_new_customer; ?></h2>
    <p><?php echo $text_checkout; ?></p>
    <div class="smart-radio">  
        <?php if ($account == 'register') { ?>
        <input id="register" type="radio" name="account" value="register" checked="checked" />
        <?php } else { ?>
        <input id="register" type="radio" name="account" value="register" />
        <?php } ?>
        <label for="register"></label>  <?php echo $text_register; ?>
    </div>
    <?php if ($checkout_guest) { ?>
    <div class="smart-radio">
      
        <?php if ($account == 'guest') { ?>
        <input id="guest" type="radio" name="account" value="guest" checked="checked" />
        <?php } else { ?>
        <input id="guest" type="radio" name="account" value="guest" />
        <?php } ?>
        <label for="guest"></label>  <?php echo $text_guest; ?>
    </div>
    <?php } ?>
    <p><?php echo $text_register_account; ?></p>
    <input type="button" value="<?php echo $button_continue; ?>" id="button-account" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary" />
  </div>
  <div class="col-sm-6">
    <h2><?php echo $text_returning_customer; ?></h2>
    <p><?php echo $text_i_am_returning_customer; ?></p>
    <div class="form-group">
      <label class="control-label" for="input-email"><?php echo $entry_email; ?></label>
      <input type="text" name="email" value="" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
    </div>
    <div class="form-group">
      <label class="control-label" for="input-password"><?php echo $entry_password; ?></label>
      <input type="password" name="password" value="" placeholder="<?php echo $entry_password; ?>" id="input-password" class="form-control" />
      <a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a></div>
    <input type="button" value="<?php echo $button_login; ?>" id="button-login" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary" />
  </div>
</div>
