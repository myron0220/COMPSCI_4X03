function interperrorpic(f,xrange,xpoints)
% interperrorpic(f,xrange,xpoints) draws picture, over interval xrange, of
% polynomial interpolation of function f at points in vector xpoints, which
% are made interactively adjustable, and of resulting interpolation error.
% f:       handle of real function of real variable. Must be coded as
%          vectorisable.
% xrange:  row 2-vector [winxlo,winxhi], the x interval on which curves
%          will be plotted.
% xpoints: vector of length nx >= 1, the initial positions of a set of
%          movable interpolation points, which the user can drag at will.
%          The polynomial has degree nx-1.
% Sample call:
%    interperrorpic(@cos,[-pi pi],linspace(-pi,pi,9));
%
% Note: The values in xpoints must be distinct. In theory the code should
% collapse when you drag one point to equal another, but I've not noticed
% trouble so far.

% My thanks to the function "window_motion_test" in the Matlab
% documentation for showing how this can be done.
% Copyright 2017 John D. Pryce, Cardiff University, UK

set(gcf,'WindowButtonDownFcn',@wbdcb);

%Find the x-range and graph the function over it
nx=numel(xpoints);
% x-range & y-range: !!IMPROVE
winxlo = xrange(1); winxhi = xrange(2);
ntpoints = 201;
%We make t, yt, pt all column vectors, which PLOT prefers
t = linspace(winxlo,winxhi,ntpoints)';
yt = f(t);
pt = newtoninterp(xpoints,f(xpoints),t);

%UPPER PLOT
axh1 = subplot(2,1,1);%Its axes handle
set(axh1,'Clipping','off',...
  'XTick',[],'YTick',[],'Box','on');
%Draw the original function and interpolating polynomial and keep handle of
%plot object. hp(1) is yt line, hp(2) is pt line.
line_yp_h = plot(t,[yt,pt]);
%Set plotting window
axh1.XLim = xrange;
axh1.YLim = expand([min(yt), max(yt)],0.3);
title(sprintf('Interpolating %s on [%g,%g] by degree %d poly',...
  func2str(f), xrange, nx-1));
str = sprintf('x%d = %g\n',[0:nx-1;xpoints]);
txt_h = text(axh1.XLim(2), axh1.YLim(1), str,...
  'VerticalAlignment','bottom');
grid on

% Create, store & draw node objects at their initial positions:
% point(1,iv) is on axis; point(2,iv) is above it on graph.
% They can't be in same graphic object as they move differently.
Nodes = gobjects(2,nx);
for i=1:nx
  xi = xpoints(i);
  %Node on axis is tagged 'xpoint'. It is put on bottom edge of axes.
  hgt = hgtransform('Tag','xpoint', 'UserData',i);
  putnode(hgt,[xi;axh1.YLim(1)]);
  patch(0,0,[.8 .8 1],'Marker','o',...
    'MarkerSize',10,'MarkerFaceColor',[.8 .8 1],'Parent',hgt);
  text(0,0,int2str(i-1),'FontSize',9,...
    'HorizontalAlignment','center','Parent',hgt);
  Nodes(1,i) = hgt;
  %Node on graph is also tagged 'xpoint'
  hgt = hgtransform('Tag','xpoint', 'UserData',i);
  putnode(hgt,[xi;f(xi)]);
  patch(0,0,[.8 .8 1],'Marker','o',...
    'MarkerSize',10,'MarkerFaceColor',[1 .8 .8],'Parent',hgt);
  Nodes(2,i) = hgt;
end
% %doesn't work as forlegend_h is wrong kind of argument to legend:
% forlegend_h = [Nodes(1,:).Children]';
% forlegend_text = {forlegend_h(:,1)};
% legend(forlegend_h,forlegend_text);

%LOWER PLOT
axh2 = subplot(2,1,2);%Its axes handle
perror = pt-yt;
absperror = abs(perror);
maxabs = max(absperror);
line_err_h = plot(t,[perror,absperror],xrange,zeros(size(xrange)),'k');
axh2.XLim = xrange;
axh2.YLim = [-maxabs,maxabs];
title('error = (polynomial-function), and |error|')
grid on

%------------------Internal Functions------------------
% The "~" below are unused callback data
  function wbdcb(src,~)
    oh = gco; %handle of "current object" = what was clicked on
    xpoint = oh.Parent;%
    % Only respond to a normal click, and on an xpoint object:
    if strcmp(src.SelectionType,'normal') && strcmp(xpoint.Tag,'xpoint')
      src.Pointer = 'crosshair';
      % To remove "jerk" as you start to move, find the displacement
      % between current point & node center and pass it as a parameter to
      % wbmcb, to adjust by.
      adjust = (axh1.CurrentPoint(1,1:2))' - getnodepos(xpoint);
      src.WindowButtonMotionFcn = {@wbmcb,xpoint,adjust};
      src.WindowButtonUpFcn = @wbucb;
    end
  end

  function wbmcb(~,~,xpoint,adjust)
    % Follow mouse motion by moving a node on x axis and the one above it
    % on the graph.
    ixpoint = xpoint.UserData; %its index in Nodes
    xc = (axh1.CurrentPoint(1,1:2))'-adjust; %x-coord of cursor
    xc = xc(1); %discard y coordinate
    % Update nodes in Figure:
    putnode(Nodes(1,ixpoint),[xc;axh1.YLim(1)]);%on axis
    putnode(Nodes(2,ixpoint),[xc;f(xc)]);%on graph
    %Cunning way to extract current x positions of nodes in a vector
    xpoints = cellfun(@(M)M(1,4),{Nodes(1,:).Matrix});
    %Update interpolating polynomial
    pt = newtoninterp(xpoints,f(xpoints),t);
    line_yp_h(2).YData = pt;
    perror = pt-yt;
    absperror = abs(perror);
    maxabs = max(absperror);
    line_err_h(1).YData = perror;
    line_err_h(2).YData = absperror;
    axh2.YLim = [-maxabs,maxabs];
    %     legend(num2str(xpoints'));%no good as doesn't match handles in plot
  end

  function wbucb(src,~)
    xpoints = cellfun(@(M)M(1,4),{Nodes(1,:).Matrix}); %again!
    txt_h.String = sprintf('x%d = %g\n',[0:nx-1;xpoints]);
    % On mouse up, unconditionally cancel "motion" & "up" callbacks
    src.Pointer = 'arrow';
    src.WindowButtonMotionFcn = '';
    src.WindowButtonUpFcn = '';
  end
end

%------------------Separate Functions------------------
function putnode(node,xy)
node.Matrix(1:2,4) = xy;
end

function xy = getnodepos(node)
xy = node.Matrix(1:2,4);
end

function ab1 = expand(ab,r)
%Expand interval [a,b] symmetrically to one (1+r) times larger.
%So move its endpoints outward by r times its radius
ab1 = ab + (r*(ab(2)-ab(1)))*[-0.5,0.5];
end

function [dds,ddtop] = DDtable(x,f,maxord)
%[dds,ddtop] = DDtable(x,f,maxord) returns in dds a divided difference
%table for the data pairs (x(i),f(i)) held in vectors x and f of length
%n+1. If maxord is omitted it defaults to n, the largest possible.
% Output:
% dds:   row cell vector of length maxord+1, whose d'th element holds the
%        d'th column of the DD table, of length n+2-d, the first column
%        being equal to f.
% ddtop: row vector of length maxord+1 holding the first element in each
%        column of the table. These are the coefficients of a Newton form
%        of the interpolating polynomial p of degree <=n that has
%        p(x(i)) = f(i) for each i. (If maxord<n it doesn't hold them all.)
n = numel(x)-1;
if nargin<3, maxord = n; end
x = x(:);
dds = cell(1,maxord+1);
ddtop = zeros(1,maxord+1);
dds{1} = f(:);
ddtop(1) = f(1);
for k=1:maxord
  ddcol = diff(dds{k})./(x(k+1:end)-x(1:end-k));
  dds{k+1} = ddcol;
  ddtop(k+1) = ddcol(1);
end
end

function y = newtoninterp(x,f,t)
%y = newtoninterp(x,f,t) forms a Newton form of the polynomial of degree
% <= n that interpolates the n+1 data values (x(i),f(i)), evaluates this at
% t and returns the result in y. If t is an array it evaluates elementwise.
[~,dd] = DDtable(x,f);
y=newtonpoly(dd,x,t);
end

function y = newtonpoly(dd,x,t)
%newtonpoly(dd,x,t) evaluates the Newton form of a polynomial at t, namely
% y = p(t) = dd(1) + dd(2)*(t-x(1)) + dd(3)*(t-x(1))*(t-x(2)) + ...
%            + dd(n+1)*(t-x(1))*(t-x(2))*...*(t-x(n))
% dd is a vector of length n+1, which is how n is computed.
% x is a vector of length at least n.
% If t is an array it computes p(t) elementwise over t.
n = numel(dd)-1;
y = dd(n+1)*ones(size(t));
for i=n:-1:1
  y = dd(i) + (t-x(i)).*y;
end
end
