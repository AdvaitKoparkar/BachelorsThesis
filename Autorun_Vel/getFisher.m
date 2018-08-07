%%CODE TO EXTRACT TWO SETS OF GRAY VALUES (BETWEEN ACTUAL AND EXPANDED,
%%BETWEEN ACTUAL AND RECEDED CONTOURS) TO COMPUTE FISHER VALUE

function fval=getFisher(in,out,al,frame,interparc,getVal)
        x1=[]; y1=[];
        x2=[]; y2=[];
        for i=1:length(in)-1,
%             in1=interparc(4,in(i:i+1,1),in(i:i+1,2));
%             al1=interparc(4,al(i:i+1,1),al(i:i+1,2));
%             out1=interparc(4,out(i:i+1,1),out(i:i+1,2));
            
            in1=[linspace(in(i,1),in(i+1,1),4)',linspace(in(i,2),in(i+1,2),4)'];
            al1=[linspace(al(i,1),al(i+1,1),4)',linspace(al(i,2),al(i+1,2),4)'];
            out1=[linspace(out(i,1),out(i+1,1),4)',linspace(out(i,2),out(i+1,2),4)'];
            
            x1=[x1; (in1(:,1)+al1(:,1))/2];
            y1=[y1; (in1(:,2)+al1(:,2))/2];
            
            x2=[x2; (out1(:,1)+al1(:,1))/2];
            y2=[y2; (out1(:,2)+al1(:,2))/2];

% % %             %%p1--from out to along 
% % %             for j=1:length(in1),
% % %                 arx=linspace(out1(j,1),al1(j,1),4)';
% % %                 ary=linspace(out1(j,2),al1(j,2),4)';
% % %                 x1=[x1;arx];
% % %                 y1=[y1;ary];
% % %             end
% % %             pause
% % % %             disp([x1,y1]); pause;
% % %             %%p2--from along to in
% % %             for j=1:length(in1),
% % %                 arx=linspace(in1(j,1),al1(j,1),4)';
% % %                 ary=linspace(in1(j,2),al1(j,2),4)';
% % %                 x2=[x2;arx];
% % %                 y2=[y2;ary];
% % %             end
% % % %             disp([x2,y2]); pause;
        end
        p1=zeros(length(x1),1);
        for j=1:length(x1),
            p1(j)=getVal([x1(j),y1(j)],frame);
        end
        p2=zeros(length(x2),1);
        for j=1:length(x2),
            p2(j)=getVal([x2(j),y2(j)],frame);
        end
        % fval=(mean(p2)-mean(p1))/(var(p1)+var(p2));
        fval=(mean(p2)-mean(p1))*(mean(p2)-mean(p1))/(var(p1)+var(p2));
%         if round(fval,4)==1.6376,
%         disp([mean(p1), mean(p2);var(p1), var(p2)]);
%         disp(fval);
%         pause;
%         end
end


%     0.1025    0.0740
%     0.0105    0.0069
% 
%     1.6376

% 0.1456    0.1833
% 0.0098    0.0052
% 
%     2.5249