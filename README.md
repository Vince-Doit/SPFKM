# SPFKM
Robust Fuzzy K-Means Clustering With Shrunk Patterns Learning

The repository contains the code for the paper titled "Robust Fuzzy K-Means Clustering With Shrunk Patterns Learning," published in TKDE in 2023. This paper tackles the challenge that conventional Fuzzy K-Means (FKM) methods perform clustering directly on the original data, where the intrinsic structure of the data may be corrupted by noise or other factors.


The core concept involves learning shrunk patterns, which can be viewed as an approximation to the original data. A penalty term is employed to measure the mismatch between the shrunk patterns and the original data. Moreover, we integrate the learning of shrunk patterns and the learning of membership degrees between shrunk patterns and clusters into a unified framework.


The repo also hosts some baseline systems as we compared in the paper. We would like to thank the authors of the baseline systems for their codes. If any baseline systems cannot be licensed freely here, please drop me an email, so we can remove it from the collection.

If you find this repo useful, please kindly cite the paper below.

@article{zhao2023robust,
  title={Robust fuzzy k-means clustering with shrunk patterns learning},
  author={Zhao, Xiaowei and Nie, Feiping and Wang, Rong and Li, Xuelong},
  journal={IEEE Transactions on Knowledge and Data Engineering},
  volume={35},
  number={3},
  pages={3001--3013},
  year={2023},
  publisher={IEEE}
}
