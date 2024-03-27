<?php echo $header; ?>
<div class="container">
  <div class="row">
    <div id="content" class="col-sm-12"><?php echo $content_top; ?>
      <div class="nav-bar breadcrumb"><?php echo $text_returning_customer; ?></div>
      <div class="row">
        <div class="col-sm-12">
          <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
            <div class="form-group input-box">
              <div class="col-sm-10 input-border">
                <input type="text" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
              </div>
            </div>
            <div class="form-group input-box">
              <div class="col-sm-10 input-border">
                <input type="password" name="password" value="<?php echo $password; ?>" placeholder="<?php echo $entry_password; ?>" id="input-password" class="form-control" />
              </div>
            </div>
            <input type="submit" value="<?php echo $button_login; ?>" class="btn btn-primary btn-block" />
            <?php if ($redirect) { ?>
            <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" class="mobile"/>
            <?php } ?>
            <div class="action-links">
              <a href="<?php echo $register; ?>"><?php echo $text_new_customer; ?></a>
              <a href="<?php echo $forgotten; ?>" class="pull-right"><?php echo $text_forgotten; ?></a>
            </div>
          </form>
        </div>
      </div>
      <?php echo $content_bottom; ?></div>
	</div>
</div>
<script>
  <?php if ($success) { ?>
    showToast('<?php echo $success; ?>');
  <?php } ?>
  <?php if ($error_warning) { ?>
    showAlert('<?php echo $error_warning; ?>');
  <?php } ?>
</script>
<?php echo $footer; ?>
