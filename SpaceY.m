solution = fminsearch(@test, [21.995, 1.727e5, 0.081e5])
% clf;
% subplot(2,1,1);
% plot(S(:,1), S(:,2), 'go');
% hold on;
% plot(S(:,4), S(:,5), 'b');
% plot(S(:,7), S(:,8), 'r');
% plot(0,0,'k.');
% xlabel('x (meters)');
% ylabel('y (meters)');
% legend('Rocket', 'Earth', 'Mars', 'Sun');
% title('Earth to Mars Transfer');
% axis equal;
% subplot(2,1,2);
% plot(closestApproach);
% min(closestApproach)