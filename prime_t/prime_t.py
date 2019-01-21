#!/usr/bin/env python

import math
import logging

def configure_logger(loglevel):
  logger = logging.getLogger(__name__)
  logger.setLevel(loglevel)

  handler = logging.StreamHandler()
  formatter = logging.Formatter("%(asctime)s - %(levelname)s - %(funcName)s - %(message)s")
  handler.setFormatter(formatter)

  logger.addHandler(handler)

def is_prime(n):
  logger = logging.getLogger(__name__)

  if n < 2:
    return "NIE" # 0, 1 nie sa liczbami pierwszymi
  #if n < 4:
  #  return "TAK" # 2, 3 to liczy pierwsze

  sqrt = math.sqrt(n)
  divisor = 2
  logger.debug("sqrt: %s" % sqrt)
  logger.debug("divisor: %s" % divisor)
  while divisor <= sqrt:
    if (n % divisor) == 0:
      return "NIE"
    divisor += 1
    logger.debug("divisor: %s" % divisor)
  return "TAK"

def main():
  #DEBUG = True
  DEBUG = False
  if DEBUG:
      configure_logger(logging.DEBUG)
  else:
      configure_logger(logging.INFO)
  logger = logging.getLogger(__name__)
  
  test_numbers = int(input())
  counter = 1
  
  logger.debug("liczba testow: %s" % test_numbers)
  
  while counter <= test_numbers:
    n = int(input())
    logger.debug("test: %s" % counter)
    logger.debug("liczba: %s" % n)
    print(is_prime(n))
    counter += 1
   
if __name__ == '__main__':
  main()

