import numpy as np
import random
import matplotlib.pyplot as plt

N=100
P=np.linspace(0, 1, N)
c=0
avg_queue_size=np.zeros(N)
for p in P:
    # print(p)
    pa=0
    pb=0
    pc=0
    pd=1
    R=2.5
    T=100000

    packet_sizes=[0, 1, 2, 3, 4]
    weights=[1-p, pa*p, pb*p, pc*p, pd*p]

    # print(random.choices(packet_sizes, weights, k=1))

    queue_size_bits=np.zeros(T+1)
    for t in range(T):
        x=random.choices(packet_sizes, weights, k=1)
        # print(x)
        if t!=0:
            queue_size_bits[t]=max(queue_size_bits[t-1]+x[0]-R,0)
        else:
            queue_size_bits[t]=max(x[0]-R,0)
    avg_queue_size[c]=np.mean(queue_size_bits)
    c+=1

fig, ax=plt.subplots()
ax.plot(P, avg_queue_size)
ax.set_title('Network Queue Simulation')
ax.set_ylabel('Queue size(bits)')
ax.set_xlabel('Probability')
plt.show()
