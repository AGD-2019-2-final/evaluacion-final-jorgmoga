import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#

if __name__ == '__main__':

    curkey = None
    agrupador = []

    for line in sys.stdin:
       key, val1, val2 = line.split()
       
       if key == curkey:
        agrupador.append(val2)

       else:
            if curkey is not None:
                agrupador = ','.join(str(i) for i in agrupador)
                sys.stdout.write("{}\t{}\n".format(curkey, agrupador))
                agrupador = []
            curkey = key 
            agrupador.append(val2)
 
    agrupador = ','.join(str(i) for i in agrupador)
    sys.stdout.write("{}\t{}\n".format(curkey, agrupador))