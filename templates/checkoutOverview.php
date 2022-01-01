<?php require_once __DIR__.'/header.php'?>
<section class="container" id="cartItems">
    <div clas="row">
      <h2>Bestellungübersicht</h2>
    </div>
    <div class="row cartItemHeader">
      <div class="col-12 text-end">
        Preis
      </div>
    </div>
    <?php foreach ($cartItems as $cartItem ):?>
      <div class="row cartItem">
        <?php include __DIR__. '/cartItem.php';?>
      </div>
    <?php endforeach;?>
    <div class="row">
    <div class="col-12 text-end">
      Summer (<?= $countCartItems ?> Arikel):<span class="price"><?=number_format($cartSum)?> €</div>
    </div>
  </div>
  <a class="btn btn-danger" href="index.php">Abbrechen</a>
  <a class="btn btn-success" href="index.php/completeOrder">Kostenpflichtig bestellen</a>
</section>
<?php require_once __DIR__.'/footer.php'?>
