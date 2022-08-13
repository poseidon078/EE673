import matplotlib.pyplot as plt

R=10000
x=[0.7*R]
y=[0.01*R]
t=0
ssth=0.04*R
while 1:
    if x[t]<ssth:
        x.append(x[t]*2)
    else:
        x.append(x[t]+1)
    if y[t]<ssth:
        y.append(y[t]*2)
    else:
        y.append(y[t]+1)
    t+=1
    if x[t]+y[t]>R:
        x.append(1)
        y.append(1)
        ssth=ssth/2
        t+=1
    if (abs(x[t]-(R/2))<R/2000) and (abs(y[t]-(R/2))<R/2000):
        break
print(t)
plt.plot(x, y)
plt.show()