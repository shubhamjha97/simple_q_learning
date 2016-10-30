function ru=run(start_state, goal_state, Q, R)
  state=start_state
  while state!=goal_state
    [actionval, action]=max(Q(state,:));
    state=action
  end
end