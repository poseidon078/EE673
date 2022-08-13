import matplotlib.pyplot as plt

R=10000
x=[0.7*R]
y=[0.01*R]
t=0
ssth=0.04*R
while 1:
    x.append(x[t]+1)
    y.append(y[t]+1)
    t+=1
    if x[t]+y[t]>R:
        x.append(x[t]/2)
        y.append(y[t]/2)
        t+=1
    if (abs(x[t]-(R/2))<R/2000) and (abs(y[t]-(R/2))<R/2000):
        break
    # print(x[t], y[t])
    # print(y[t])
print(t)
plt.plot(x, y)
plt.show()