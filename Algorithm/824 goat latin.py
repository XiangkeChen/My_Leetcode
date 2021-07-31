def toGoatLatin(sentence):
    
    senten = sentence.split()
    
    for i in range(len(senten)):
        if senten[i][0].lower() in ('a','e','i','o','u'):
            senten[i] = senten[i][:] + 'ma'
        else:
            senten[i] = senten[i][1:] + senten[i][:1] + 'ma'
            
        senten[i] = senten[i][:] + 'a' * (i+1)
        
    print(" ".join(senten))



toGoatLatin("I speak Goat Latin")