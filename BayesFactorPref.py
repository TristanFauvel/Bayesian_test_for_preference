# %%
import numpy as np
import sympy as smp
import scipy.integrate as integrate
import math

def BayesFactorPref(f, n):

    y = n * f
    V = np.var(f)
    ksi = np.mean(f)

    G = y.shape[0]

    if all(f == 1):
        return math.inf
    elif all(f == 0):
        return 0 
    # %%
    w = smp.symbols("w", real=True)

    equation = ksi * (1 - ksi) / (1 + 1 / w) - V

    w = smp.solve(equation, w)[0]

    f1 = lambda i, ksi: np.product(np.arange(1, y[i] + 1) - 1 + ksi / w)
    f2 = lambda i, ksi: np.product(np.arange(1, (n[i] - y[i])) - 1 + (1 - ksi) / w)
    f3 = lambda i: np.product(np.arange(i, n[i] + 1) - 1 + 1 / w)

    fun = lambda ksi: integrand(f1, f2, f3, G, ksi)
    H1 = integrate.quad(fun, 0.5, 1)
    H0 = integrate.quad(fun, 0, 0.5)

    BF_10 = H1[0] / H0[0]
    # A Bayes factor above 1 means than H1 is more strongly supported than H0.

    return BF_10


def integrand(f1, f2, f3, G, ksi):
    v = np.zeros((G, 1))
    for i in range(G):
        v[i, :] = f1(i, ksi) * f2(i, ksi) / f3(i)
    v = np.product(v)
    return v
