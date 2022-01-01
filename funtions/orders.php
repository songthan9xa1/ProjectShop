<?php
function createOrder(int $userId,array $cartItems,array $deliveryAddressData,string $status = 'new'):bool
{
  $sql="INSERT INTO orders SET
  status = :status,
  orderDate= :orderDate,
  deliveryDate= :deliveryDate,
  userId = :userId";
  $statement = getDB()->prepare($sql);
  if(false===$statement)
  {
    echo prinDBErrorMessage();
    return false;
  }
  $data = [
    ':status'=>$status,
    ':userId'=>$userId,
    ':orderDate'=>date('Y-m-d'),
    ':deliveryDate'=>'0000-00-00'
  ];
  $created=$statement->execute($data);
  if(false=== $created)
  {
    echo prinDBErrorMessage();
    return false;
  }
  $orderId= getDB()->lastInsertId();
  $sql="INSERT INTO order_address SET
  order_id = :orderId,
  recipient= :recipient,
  city = :city,
  street = :street,
  streetNumber = :streetNumber,
  zipCode = :zipCode";
  $statement = getDB()->prepare($sql);
  if(false===$statement)
  {
    echo prinDBErrorMessage();
    return false;
  }
  $data = [
    ':orderId'=>$orderId,
    ':recipient'=>$deliveryAddressData['recipient'],
    ':city'=>$deliveryAddressData['city'],
    ':street'=>$deliveryAddressData['street'],
    ':streetNumber'=>$deliveryAddressData['streetNumber'],
    ':zipCode'=>$deliveryAddressData['zipCode'],
  ];
  $created=$statement->execute($data);
  if(false === $created)
  {
    echo prinDBErrorMessage();
    return false;
  }
  $sql ="INSERT INTO order_products SET
  titel = :titel,
  amount = :amount,
  price = :price,
  taxInPercent = :taxInPercent,
  orderId = :orderId ";
  $statement = getDB()->prepare($sql);
  if(false===$statement)
  {
    echo prinDBErrorMessage();
    return false;
  }
  foreach($cartItems as $cartItem)
  {
    $taxInPercent=19;
    $price = $cartItem['price'];
    $netPrice=number_format(((100-$taxInPercent)/100)*$price,2);
    $data = [
      ':titel'=> $cartItem['titel'],
      ':amount'=> $cartItem['amount'],
      ':price' => $netPrice,
      ':taxInPercent'=> 19,
      ':orderId'=> $orderId,
    ];
    $created=$statement->execute($data);
    if(false === $created)
    {
      echo prinDBErrorMessage();
      break;
    }
  }
  return $created;
}
function getOrderSumForUser(int $orderId,int $userId):?array
{
  $sql="SELECT SUM(price*amount) AS sumNet,
  CONVERT(SUM(price*amount)*(1+taxInPercent/100), DOUBLE) AS sumBrut,
  CONVERT((SUM(price*amount)*(1+taxInPercent/100))-(SUM(price*amount)), DOUBLE) AS taxes
  FROM order_products op INNER JOIN orders o ON(op.orderId=o.id) WHERE userId = :userId AND orderId = :orderId";
  $statement =getDB()->prepare($sql);
  if(false === $statement)
  {
    echo prinDBErrorMessage();
    return null;
  }
  $statement->execute(
    [
      ':orderId'=>$orderId,
      ':userId'=>$userId
    ]
  );
  if(0===$statement->rowCount())
  {
    return null;
  }
  return $statement->fetch();
}
function getOrderForId(int $userId):int
{
  $sql="SELECT id FROM orders WHERE userId= :userId ORDER BY id DESC LIMIT 1";
  $statement = getDB()->prepare($sql);
  if(false===$statement)
  {
    echo prinDBErrorMessage();
    return null;
  }
  $statement->execute([
    ':userId'=>$userId
  ]);
  return (int)$statement->fetchColumn();
}
function getOrderForUser(int $orderId,int $userId):?array
{
  $sql="SELECT orderDate,deliveryDate,status,userId,id FROM orders WHERE id= :orderId AND userId= :userId LIMIT 1";
  $statement = getDB()->prepare($sql);
  if(false===$statement)
  {
    echo prinDBErrorMessage();
    return null;
  }
  $statement->execute([
    ':orderId'=>$orderId,
    ':userId'=>$userId
  ]);
  if(0===$statement->rowCount())
  {
    return null;
  }
  $orderData=$statement->fetch();
  $orderdate = date_create($orderData['orderDate']);
  $deliveryDateFormatted='Noch nicht angegeben';
  if($orderData['deliveryDate']!=="0000-00-00")
  {
    $deliveryDate= date_create($orderData['deliveryDate']);
     $deliveryDateFormatted=date_format($deliveryDate,'d.m.y');
  }
  $orderData['deliveryDateFormatted']= $deliveryDateFormatted;
  $orderData['orderDateFormatted']= date_format($orderdate,'d.m.y');
  $orderData['products'] = [];
  $orderData['deliveryAddressData'] = [];
  $sql="SELECT recipient, streetNumber, city, street, zipCode, type FROM order_address WHERE order_id= :orderId LIMIT 1";
  $statement = getDB()->prepare($sql);
  if(false===$statement)
  {
    echo prinDBErrorMessage();
    return null;
  }
  $statement->execute([':orderId'=>$orderId]);
  if(0===$statement->rowCount())
  {
    return null;
  }
  $orderData['deliveryAddressData']=$statement->fetch();
  $sql="SELECT id,titel,amount,price,taxInPercent FROM
  order_products WHERE orderId=:orderId";
  $statement = getDB()->prepare($sql);
  if(false===$statement)
  {
    echo prinDBErrorMessage();
    return null;
  }
  $statement->execute([
    ':orderId'=>$orderId
  ]);
  if(0===$statement->rowCount())
  {
    return null;
  }

  while($row=$statement->fetch())
  {
    $orderData['products'][]=$row;
  }
  return $orderData;
}
