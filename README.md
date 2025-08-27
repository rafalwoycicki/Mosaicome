# 🧬 Mosaicome 

**Assembling the bigger picture of the genome, one piece at a time.**

[![Status: In Progress](https://img.shields.io/badge/Status-In%20Progress-blue)](https://github.com/collaborativebioinformatics/Mosaicome)
[![Hackathon: Mosaic SV](https://img.shields.io/badge/Hackathon-Mosaic%20SV%20ROM-brightgreen)](https://github.com/collaborativebioinformatics/Mosaicome)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

---

A central repository for **Team Mosaicome**'s project for the **Mosaic SV ROM Collaborative Bioinformatics SVM Hackathon**. Our goal is to develop an innovative machine learning pipeline for the accurate detection of genomic structural variations.

### **Table of Contents**
1. [The team](#-the-team)
2. [The Problem](#-the-problem)
3. [Tech Stack](#-tech-stack)
4. [Dataset](#-the-data)
5. [Project Roadmap](#-project-roadmap)
6. [Getting Started](#-getting-started)


---

### 👥 **The Team**

- [Luis Paulin](https://github.com/lfpaulin)
- [Daniel Baker](https://github.com/dnbaker)
- [Rafal Woycicki](https://github.com/rafalwoycicki)
- [Rajarshi Mondal](https://github.com/Rajarshi0)
- [Gerardo Fabián](https://github.com/Gedofs)
- [Asmaa Mahmoud](https://github.com/asmmahmoud)
- [Adrian Chalco](https://github.com/chalco777)
- [Gobikrishnan Subramaniam](https://github.com/gobikrishnan-s3141)
- [Ammara Saleem](https://github.com/ammarasaleem123)
- [Gavin Monahan](https://github.com/gavinmonahan)
- [Jacob Krol](https://github.com/jakekrol)
- [Neda Ghohabi Esfahani](https://github.com/nadiabaig)


---

### ❓ **The Problem**

Structural Variants (SVs) calling is a challenging process in which variants > 50bp are detected when compared to the reference genome. Many tools are available and already capable of detecting germline SVs. Low-frequency SVs (<20% VAF, aka mosaic) comprise a greater challenge as the signal is low. Our current strategy is able to detect ~50% of the SVs (VAF 5-100%) with 90% precision

ONT sequencing is still under development and new models for basecalling as well as new tools for aligning showed up since May this year. Better reads quality, meaning better nucleotides calling probabilities will allow better mapping, when using suited aligning tools.

Our goal is to improve recall without affecting much precision




---

### 🛠️ **Tech Stack**

This project will leverage a modern, open-source technology stack.

| Category          | Technology / Library                               | Purpose                               |
| ----------------- | -------------------------------------------------- | ------------------------------------- |
| **Language** | `Python 3.12+`                                      | Core programming language             |
| **Data Handling** | `Pandas`, `NumPy`                                  | Data manipulation & numerical analysis|
| **Alignment** | `Minimap2`, `Winnowmap`, `abpoa`                        | Data mapping & assembly             |
| **SV calling** | `Sniffles2`                                  | Data manipulation & numerical analysis|
| **Visualization** | `Matplotlib`, `IGV`                            | Plotting results & data exploration   |
| **Development** | `Jupyter Lab`, `VS Code`                           | Interactive analysis & coding         |
| **Collaboration** | `Git`, `GitHub`                                    | Version control & project management  |

---

### 💾 **The data**

Long-read sequencing of six individuals from the HapMap project. The mix was done in-vitro so all sequencing randomness affect all samples the same
We have a high-quality benchmark dataset derived from assemblies


---

### 🗺️ **Project Roadmap**


Our progress will be tracked through the following key phases and milestones.

| Phase | Status | Key Milestones                                                                 |
| :---: | :----: | ------------------------------------------------------------------------------ |
| **1** |  `⏳`  | **Exploration & Strategy** <br> ⚫ Data Analysis <br> ⚫ Steps |
| **2** |  `⚪`  | **Development & Prototyping** <br> ⚫ Steps <br> ⚫ Steps |
| **3** |  `⚪`  | **Refinement & Validation** <br> ⚫ Stepsg <br> ⚫ Validation <br> ⚫ Final Documentation |

*Status Key: `⚪` Not Started, `⏳` In Progress, `✅` Completed*

#### **Exploration & Strategy**
Strategies:
 - Testing different parameters from each filter applied, some SVs were detected but filtered
 - As we are at the mercy of the aligners, we can improve alignment on candidate regions 
    - Re-alignment with newer options (eg minimap lr:hq, suited for reads with Phred Q > 20). Or one can optionally remap with Winnowmap as this tool depicted reduction in mapping error rate.
    - Traversal of full mm2 alignments via SA tag parsing. Group sequences by sets of aligned regions, as well as possibly merging across homologous regions using XA tags.
    - Align reads to the reference (mm2, winnowmap) several times with different parameters.
        - Take reference windows and cluster reads by aligned regions.
        - Take abnormal events (e.g., aligning two similar regions on 2 different chromosomes or different strands on the same chromosome) and then feed into sequence clustering/consensus to get candidate haplotypes.
        - Align the local reads against generated haplotypes to filter for misassemblies/low quality results.
 - Assembly of candidate regions abpoa, which can potentially provide local haplotypes. It can automatically group and generate consensus, and it's pretty fast. 
 - Define attributes of FNs to examine, then contrast attribute distribution to TPs
    - Attributes
        - number of supporting reads
        - Mapping quality
        - Avg. # of supplementary alignments for supporting reads

#### **Development**
🚧

#### **Validation**
🚧

---

### 🚀 **Getting Started**

*(This section will be updated with instructions on how to set up the environment and run the project.)*

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/collaborativebioinformatics/Mosaicome.git

    ```
2.  **Set up the environment:**
    ```bash
    # Command to be added
    ```
3.  **Run the pipeline:**
    ```bash
    # Command to be added
    ```

