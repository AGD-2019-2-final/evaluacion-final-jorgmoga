import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == '__main__':
    
    conteo = 0

    for line in sys.stdin:
        line = line.strip()
        val3, val2, key, val1 = line.split("\t")
        sys.stdout.write("{}\t{}\t{}\n".format(key, val1, val2))
        conteo += 1
        
        if conteo == 6:
            break