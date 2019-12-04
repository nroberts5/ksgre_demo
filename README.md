# ksgre_demo
Example of using KS Foundation (ksfoundationepic.org) for pulse sequence development

## Tutorial
KS Foundation offers a detailed tutorial at their website, ksfoundationepic.org. The purpose of this repository is to facilitate a live demo and offer step by step commits that walk through the solution. This tutorial is simply to change a monopolar SGRE sequence to a bipolar SGRE sequence with flyback gradients. Additionally, a z-rewinder gradient is added.

#### Step 1: Initialize Flyback Gradient
* Add flyback gradient trapezoids to KSGRE_SEQUENCE struct. 
* Add userCV to control when they are used.

#### Step 2: Setup Flyback Objects
* Setup flyback gradients in ksgre_eval_setupobjects()
* Adjust spoiler gradient polarity based on flyback CV

#### Step 3: Ensure Monopolar Recon
* ksgre_init_UI()
  * Set eeff to 0
* ksgre_predownload_setrecon()
  * rhdacqctrl &= ~8 (turn off eeff)
  * Set eeff to 0 (again, just in case)

#### Step 4: Place Flyback Gradients on XGRAD
* ksgre_pg() (This is the main pulse sequence in ksgre.e using the sequence objects in KSGRE_SEQUENCE)
  * Conditional on flyback CV, use place flyback gradients between readout trapezoids and don’t invert readout amplitude.

* In ksgre.e predownload():
  * Conditionally modify GEReq_predownload_setrecon_annotations_readtrap to ensure correct ihte values (echo times)

#### Compile with psdqmake. Verify with WTools, EvalTool, MDGSim (or ksplot)

### Bonus
#### Step 5: Fully implement unique objects for X and Z spoiler gradients
#### Step 6: Fully implement z phase encode rewinder
