quart.scores <- function(trs){
	     # All branches require a length (even if a dummy, e.g. 1).
	     qscores <- matrix(NA, length(trs), length(trs))
	     nedges <- sapply(trs, Nedge)
	     for(i in 1:length(trs)){
	     	   for(j in i:length(trs)){
		   	 trstemp <- trs[c(i,j)][order(nedges[c(i,j)])]
			 brsavail <- get.locus.rates(trstemp[[1]], sptr = trstemp[[2]], branch.support.threshold = 0, branch.length.threshold = 0)
			 if(all(is.na(brsavail))) qscores[j,i] <- 0 else qscores[j,i] <- sum(!is.na(brsavail)) / min(nedges[c(i,j)])
		   }
	     }
	     qscores <- as.dist(qscores)
	     return(qscores)
}