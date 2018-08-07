%% Full Autorun

function full_autorun(sub)

    disp('VEL');
    cd ./Autorun_Vel;
    autorun(sub);
    cd ../
    
    disp('UL');
    cd ./Autorun_UL;
    autorun(sub);
    cd ../
    
    upper_contour(sub);

    disp('TON1');
    cd ./Autorun_Ton1/
    autorun(sub);
    cd ../
    
    ton3_contour(sub);
    
    disp('TON3');
    cd ./Autorun_Ton3/
    autorun(sub);
    cd ../
    
    disp('TON2');
    cd ./Autorun_Ton2/
    autorun(sub);
    cd ../
    
    join_lower_contours(sub);

end
