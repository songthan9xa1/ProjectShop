<?php require_once __DIR__.'/header.php' ?>

<section class="container" id="selectPaymentMethod">
  <?php if($hasErrors):?>
    <ul class="alert alert-danger">
      <?php foreach($error as $errorMessage):?>
        <li><?= $errorMessage ?></li>
      <?php endforeach;?>
    </ul>
  <?php endif?>
  <form method="POST" action="index.php/selectPayment">
    <?php foreach($availiablePaymentMethods as $value => $text):?>
      <div class="form-check">
        <input type="radio" class="form-check-input" name="paymentMethod" id="payment<?=$text?>" value="<?=$value?>">
        <label class="form-check-label" for="payment<?=$text?>">
          <h4><?=$text?></h4>
        </label>
      </div>
    <?php endforeach;?>
    <button type="submit" class="btn btn-primary">Weiter zur Bezahlung</button>
  </form>
</section>

<?php require_once __DIR__.'/footer.php' ?>
