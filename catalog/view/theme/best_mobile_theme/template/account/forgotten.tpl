<?php echo $header; ?>
<div class="container">
  <div class="row">
    <div id="content" class="col-sm-12"><?php echo $content_top; ?>
      <div class="nav-bar breadcrumb"><?php echo $heading_title; ?></div>
      <div class="row widget">
        <div class="col-xs-12"><?php echo $text_email; ?></div>
      </div>
      <?php if ($error_warning) { ?>
      <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
      <?php } ?>
      <div class="row widget">
        <div class="col-xs-12">
          <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
            <fieldset>
              <div class="form-group required input-box">
                <label><?php echo $text_your_email; ?></label>
                <div class="input-border">
                  <div class="unilateral-input">
                    <input type="text" name="email" value="" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
                  </div>
                </div>
              </div>
              <input type="submit" value="<?php echo $button_continue; ?>" class="btn btn-primary btn-block" />
            </fieldset>
          </form>
        </div>
      </div>
      <?php echo $content_bottom; ?></div>
    </div>
</div>
<?php echo $footer; ?>
