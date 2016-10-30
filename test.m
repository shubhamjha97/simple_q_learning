R=zeros(6,6);
R=R-1;
R([5,10,12,16,20,21,23,25,28,30])=0;
R([32,35,36])=100;
Q=zeros(6,6);
gamma=0.8;
goal_state=6;


%STATES correspond to ROWS
%ACTIONS correspond to COLUMNS
state=randi([1,6]);  %Select a state randomly
for iter=1:1000 %run for 1000 iterations
  actionset=[];  %Create an empty actionset
  %Build an actionset
  for action=1:6
    if R(state, action)!=(-1)
      actionset(end+1)=action;
     end %Created set of all possible actions
   end
  action=actionset(randi(numel(actionset))); %Select Random action
  next_state=action;
  Q(state, action)=R(state,action)+gamma*(max(Q(next_state,:))); %This wont work. Check it. Now, it just might;
  state=next_state;
end

Q=Q*100/max(Q(:))

start_state=2
run(start_state, goal_state, Q, R)