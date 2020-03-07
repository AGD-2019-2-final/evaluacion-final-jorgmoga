import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == '__main__':

    curkey = None
    maximo = None
    minimo = None

    for line in sys.stdin:

        key, val = line.split("\t")
        val = float(val)

        if key == curkey:
                
            if val > maximo:
                maximo = val
                
            if val < minimo:
                minimo = val
            
        else:

            if curkey is not None:
    
                sys.stdout.write("{}\t{}\t{}\n".format(curkey, maximo, minimo))

            curkey = key
            maximo = val
            minimo = val

    sys.stdout.write("{}\t{}\t{}\n".format(curkey, maximo, minimo))