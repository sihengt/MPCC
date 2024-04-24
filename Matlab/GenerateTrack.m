% Define the parameters
radius_center = 0.5;     % Radius of the center circle
track_width = 0.1;        % Width of the track
n_points = 666;         % Number of points to sample

% Calculate the radii for inner and outer circles
radius_inner = radius_center - track_width;
radius_outer = radius_center + track_width;

% Generate angles
theta = linspace(0, 2*pi, n_points + 1); % +1 to make the start and end points the same
theta(end) = []; % Remove the last point to avoid duplication of the first point

% Initialize matrices to hold the coordinates
track3 = struct('inner', zeros(2, n_points), 'center', zeros(2, n_points), 'outer', zeros(2, n_points));

% Calculate the (x, y) coordinates for each point on each circle
track3.center(1, :) = radius_center * cos(theta);
track3.center(2, :) = radius_center * sin(theta);
track3.inner(1, :) = radius_inner * cos(theta);
track3.inner(2, :) = radius_inner * sin(theta);
track3.outer(1, :) = radius_outer * cos(theta);
track3.outer(2, :) = radius_outer * sin(theta);

save("Tracks/track3.mat", "track3")