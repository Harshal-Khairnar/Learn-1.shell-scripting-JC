{
  sum+=$5
  if(NR==1){
    min=$5
    max=$5
    min_file=$9
    max_file=$9
  }	

  if($5 > max){
     max=$5
     max_file=$9
  }

  if(min > $5){
     min=$5
     min_file=$9		
  }
 
}
 END{
    print "SUM: ",sum/1024/1024," MB"
    print "Files: ",NR
    if(stats==1){
	print "Largest file:\t",max_file,"\t(",max/1024/1024,"MB)"
	print "Smallest file:\t",min_file,"\t(",min/1024/1024,"MB)"
    }
}
