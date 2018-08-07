% % % load Fisher_Matrix_clip361
% % % FM=fisher_matrix';
% % % load DTW_Matrix
% % % DM=DTW_Matrix;

function OI=bestmap(FM,DM,lambda)

COST=0*FM;
BackTrack=0*FM-1;

% lambda=100;

[N M]=size(FM);

COST(:,1)=FM(:,1);

for j=2:M
    
    for i=1:N
        
        temp=zeros(1,N);
        
        for k=1:N
            
            temp(k)=COST(k,j-1)-lambda*DM(k,i);
            
        end
        [val ind]=max(temp);
        BackTrack(i,j)=ind;
        COST(i,j)=val+FM(i,j);
    end
end

[val ind]=max(COST(:,M));
OI=ind;
for i=M:-1:2
    temp=BackTrack(OI(1),i);
    OI=[temp OI];
end


% % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % 
% % % load TestAndTraining-Set1-F1/Master_F1_training.mat
% % % TR=Master;
% % % load TestAndTraining-Set1-F1/Master_F1_test.mat
% % % TEST=Master;
% % % 
% % % for i=1:M
% % %     imagesc(TEST(i).Frame);hold on;
% % %     org=TEST(i).Along;
% % %     plot(org(:,1),org(:,2),'g*');
% % %     pred=TR(OI(i)).Along;
% % %     plot(pred(:,1),pred(:,2),'r*');hold off;
% % %     title(i);pause
% % % end
% % % 
