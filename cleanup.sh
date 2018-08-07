

for part in Autorun_Ton1 Autorun_Ton2 Autorun_Ton3 Autorun_Vel Autorun_UL
do
	cd $part
		
		for sub in F1 F2 M1 M2
		do
			cd $sub			
			for fold in Fold1 Fold2 Fold3 Fold4 Fold5
			do
				cd $fold				
				# rm Problem/*
				# rm -vrf !(Problem|Test.mat|Training.mat|Dev.mat)
				find . -not -name 'Dev.mat' -not -name 'Test.mat' -not -name 'Training.mat'  -not -name 'Problem' -delete
				# pwd				
				cd ../
			done			
			cd ../
		done
	cd ../
done

for part in Upper_contours Lower_contours
do
	cd $part
		
		for sub in F1 F2 M1 M2
		do
			cd $sub			
			for fold in Fold1 Fold2 Fold3 Fold4 Fold5
			do
				cd $fold				
				# rm Problem/*
				# rm -vrf !(Problem|Test.mat|Training.mat|Dev.mat)
				# find . -not -name 'Dev.mat' -not -name 'Test.mat' -not -name 'Training.mat'  -not -name 'Problem' -delete
				# pwd				
				rm ./*
				cd ../
			done			
			cd ../
		done
	cd ../
done
