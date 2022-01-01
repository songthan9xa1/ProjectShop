<?php require_once __DIR__.'/header.php'?>
  <section class="container" id="cartItems">
    <div clas="row">
      <h2>Warenkorb</h2>
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
        Summer (<?= $countCartItems ?> Arikel):<span class="price"><?=$cartSum?> €</div>
      </div>
    </div>
    <div class="row">
      <a href="index.php/checkout"class="btn btn-primary col-12">Zur Kasse</a>
    </div>
  </section>
<?php require_once __DIR__.'/footer.php'?>
