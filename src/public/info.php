<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Matrimony</title>
</head>

<body>
  <?php echo "Hello PHP"; ?>

  <?php
  function add($num1, $num2)
  {
    return $num1 + $num2;
  }

  // Example usage
  $number1 = 5;
  $number2 = 10;

  $sum = add($number1, $number2);

  echo "The sum of $number1 and $number2 is: $sum";
  ?>

  <?php echo xdebug_info(); ?>



</body>

</html>