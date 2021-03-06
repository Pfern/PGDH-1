library(ape) #this gives the plotting functions for phylogenies
library(phyclust) #this contains ms (Hudsons program)


plot_ms_tree = function(nsamples, ms_options)
  # Plots the phylogenetic tree generated by ms with the given parameters
  # need phyclust and ape libraries
  # library(phyclust);
  # library(ape);
{
  # Run the ms command
  ret.ms <- ms(nsam = nsamples, opts = ms_options);
  # Get the tree in the newick format
  tree.anc <- read.tree(text = ret.ms[3]);
  tree.anc$tip.label = substr(tree.anc$tip.label, 2, 5)
  l1 = as.numeric(tree.anc$tip.label)
  # Plot the tree
  res1 = plot.phylo(tree.anc,type="phylogram", direction = "downwards", show.tip.label = T,plot=F)
  ylim = res1$y.lim
  ylim[1] = -0.02*ylim[2]
  cvec = c(rep(2,nsamples/2),rep(3,nsamples/2))
  res1 = plot.phylo(tree.anc,type="phylogram", direction = "downwards", show.tip.label = T,y.lim=ylim,tip.color=cvec[l1])
  axis(2)
  print(ret.ms)
  
  list(tree=tree.anc, phylo =res1)
}

#res1 = plot_ms_tree(10, "-T" )
res1 = plot_ms_tree(16, "-T -I 5 8 8 0 0 0 10" )
#the ms command here is for 10 genes 5 demes with 10 samples from each, and symmetrical migration with 4Nm = 10. 
#The colours correspond to the different demes from which the genes were sampled.
#try also 4Nm=0.1
