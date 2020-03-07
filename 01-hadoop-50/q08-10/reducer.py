import sys
#
# >>> Escriba el codigo del reducer a partir de este punto <<<
#
if __name__ == '__main__':

    curkey = None
    suma = 0
    conteo = 0

    for line in sys.stdin:

        key, val1, val2 = line.split("\t")
        val1=float(val1)
        val2=float(val2)

        if key == curkey:
            suma += val1
            conteo += val2
            
        else:

            if curkey is not None:
    
                sys.stdout.write("{}\t{}\t{}\n".format(curkey, suma,suma/conteo))

            curkey = key
            suma = val1
            conteo = val2

    sys.stdout.write("{}\t{}\t{}\n".format(curkey, suma,suma/conteo))