def square(n):
  return n**2

def cube(n):
  return n**3

def abs_val(n):
  return n if n >= 0 else -n

def factorial(n):
  if n < 0:
    print("Pas de nombres complexes aujourd'hui !")
    return None
  if n == 0:
    return 1
  return n * factorial(n-1)

def mode(liste):
  dico = {item:0 for item in liste}
  for item in liste:
    dico[item] += 1
  modal_val = 0
  modal = list(dico.keys())[0]
  for k, v in dico.items():
    if v > modal_val:
      modal_val = v
      modal = k
  return modal

def average(liste):
  total = 0
  count = 0
  for i in liste:
    total += i
    count += 1
  try:
    return total/count
  except ZeroDivisionError:
    print("Pas de moyenne d'une liste vide !")

def minimum(liste):
  sol = liste[0]
  for item in liste:
    if item < sol:
      sol = item
  return sol

def maximum(liste):
  sol = liste[0]
  for item in liste:
    if item > sol:
      sol = item
  return sol
