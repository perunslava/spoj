<?php

function is_prime( int $n, bool $debug_mode ) {
  if ( $debug_mode == True ) { echo "is_prime - n: $n \n"; }
  if ( $n < 2 ) { return 'NIE'; }

  $sqrt = sqrt($n);
  $divisior = 2;
  if ( $debug_mode == True ) { echo "is_prime - sqrt: $sqrt \n"; }
  if ( $debug_mode == True ) { echo "is_prime - divisior: $divisior \n"; }
  while ( $divisior <= $sqrt ) {
    if ( ($n % $divisior) == 0 ) { return 'NIE'; }
    $divisior += 1;
    if ( $debug_mode == True ) { echo "is_pime - divisior: $divisior \n"; }
  }
  return 'TAK';
}

function main() {
  #$debug_mode = True;
  $debug_mode = False;

  $test_numbers = trim(fgets(STDIN));
  $counter = 1;
  if ( $debug_mode == True ) { echo "main - test_numbers: $test_numbers \n"; }

  while( $counter <= $test_numbers ) {
    $n = trim(fgets(STDIN));
    if ( $debug_mode == True ) { echo "main - counter: $counter \n"; }
    if ( $debug_mode == True ) { echo "main - n: $n \n"; }
    $ret = is_prime($n, $debug_mode);
    echo "$ret\n";
    $counter += 1;
  }

}

main();
