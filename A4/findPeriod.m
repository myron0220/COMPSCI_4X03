function period = findPeriod(t, x, y, z)
% Using matlab's timeseries to interpolate the data
xyz = [x, y, z];
ts = timeseries(xyz, t, 'Name', 't-xyz');
ts.TimeInfo.Units = '100 Days';
t_interp = ts.Time(1) : 1/100 : ts.Time(end); % interpolate by a day
tsInt = resample(ts, t_interp);
xyzInt = tsInt.Data;

% test: plot to visualize the interpolation
% figure()
% plot3(xyz(:,1),xyz(:,2),xyz(:,3),'bo','LineWidth',2,'DisplayName','Original (2-min)')
% hold on
% plot3(xyzInt(:,1),xyzInt(:,2),xyzInt(:,3),'r.','MarkerSize',3,'DisplayName','Interpolated (1-sec)')
% grid on
% legend('Location','SouthOutside');

TT = array2timetable(tsInt.Data,...
    'RowTimes',days(tsInt.Time*100), ...
    'VariableNames', {'x','y','z'});
% head(TT)
% transform timetable to matrix
tt = [days(TT.Time), TT.x, TT.y, TT.z];

[n, ~] = size(tt);
% finding the minimum period
stepsize = 30;
base_case = tt(1,:);
for T = stepsize : stepsize : n - 1
    cur_case = tt(1 + T, :);
    if (cur_base(2)^2 - base_case(2)^2 = )
end



end