function xb = incsearch(func,xmin,xmax,ns)
% incsearch: incremental search root locator
% xb = incsearch(func,xmin,xmax,ns):
% finds brackets of x that contain sign changes
% of a function on an interval
% input:
% func = name of function
% xmin, xmax = endpoints of interval
% ns = number of subintervals (default = 50)
% output:
% xb(k,1) is the lower bound of the kth sign change
% xb(k,2) is the upper bound of the kth sign change
% If no brackets found, xb = [].
if nargin < 3, error('at least 3 arguments required'), end
if nargin < 4, ns = 50; end %if ns blank set to 50
% Incremental search
   x = linspace(xmin,xmax,ns);
   f = func(x);
   nb = 0; xb = []; %xb is null unless sign change detected
for k = 1:length(x)-1
   if sign(f(k)) ~= sign(f(k+1)) %check for sign change
      nb = nb + 1;
      xb(nb,1) = x(k);
      xb(nb,2) = x(k+1);
   end
end
if isempty(xb) %display that no brackets were found
    disp('no brackets found')
    disp('check interval or increase ns')
else
    disp('number of brackets:') %display number of brackets
    disp(nb)
end