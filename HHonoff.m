figure
hold on
[t,ySS] = ode45(@HH,[0 20],[-60 0.5 0.5 0.5]);
for i = 1:10
    % first refiguring of t,ySS was originally here, moved until after the
    % first plot is made, allowing the first firing of the neuron to be
    % plotted
    if max(ySS(:,1))> 0 
        h = plot(t,ySS(:,1),'r-');
        text(t(ySS(:,1)==max(ySS(:,1))),max(ySS(:,1)),num2str(i));
    else
        m = plot(t,ySS(:,1),'k-');       
    end
    [t,ySS] = ode45(@HH,[0 20],[ySS(end,1)+i ySS(end,2) ySS(end,3) ySS(end,4)]); % moved to here
end
line([0 20],[0 0]);
xlabel('Time (ms)'), ylabel('Transmembrane potential (mV)'), title('On/Off Action Potential');
legend([h,m],'Peak pot. above 0 mV, neuron fires','Peak pot. 0 mV or below, neuron does not fire');