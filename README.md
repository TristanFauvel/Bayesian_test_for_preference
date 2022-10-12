# Bayesian test for preference

Consider a situation where the goal is to identify which of two configurations is preferred. 
For example, we would like to know if people in a population prefer blue vs red items.
Each participant $i$ among a total of $N$ performs $n_i$ pairwise comparisons between objects of the two colors. 
We would like to use a statistical test to determine which of the two  configurations is preferred.
The two competing hypotheses are $H_1$ (resp. $H_2$): items in the configuration $A_1$ (resp. $A_2$) are preferred to items in configuration $A_2$ (resp. $A_1$). 
This repository contains the code to run a Bayesian analysis method for this problem based on the Bayes factor. It is adapted from Kass & Raftery, 1995 (see also chapter 5 of Robert, 2005) and was first published in Fauvel & Chalk, 2022. 

## Maths

The derivation of the Bayes factor for preference comparisons is presented in the notebook TestBayesFactorPref.ipynb

## Code usage

I provide both a Python and a Matlab implementation of the BayesFactorPref function in this repository. In order to test it, you can use TestBayesFactorPref either in Matlab or Python.

## References

- R. E. Kass and A. E. Raftery. Bayes Factors. J. Am. Stat. Assoc., 90(430):773, 1995
- C. P. Robert. Le choix bayésien. Statistique et probabilités appliquées. Springer-Verlag, Paris, 2006.
- T. Fauvel and M. Chalk, (2022). Human-in-the-loop optimization of visual prosthetic stimulation. Journal of Neural Engineering,19(3), 036038. 

 If you use this software, please reference it as follows : T. Fauvel and M. Chalk, (2022). Human-in-the-loop optimization of visual prosthetic stimulation. Journal of Neural Engineering,19(3), 036038. 

 ## License
   This software is distributed under the MIT License. Please refer to the file LICENCE.txt included for details.
