function output = bil_interp(image, new_row, new_col)

ip_row = size(image,1);
ip_col = size(image,2);

ratio_row = ip_row/new_row;
ratio_col = ip_col/new_col;

[cf, rf] = meshgrid(1:new_col,1:new_row);

rf = rf*ratio_row;
cf = cf*ratio_col;

r = floor(rf);
c = floor(cf);

r(r<1)=1;
c(c<1)=1;
r(r>ip_row-1) = ip_row-1;
c(c>ip_col-1) = ip_col-1;

delta_r = rf-r;
delta_c = cf-c;

in1_ind = sub2ind([ip_row, ip_col], r, c);
in2_ind = sub2ind([ip_row, ip_col], r+1,c);
in3_ind = sub2ind([ip_row, ip_col], r, c+1);
in4_ind = sub2ind([ip_row, ip_col], r+1, c+1);

output = zeros(new_row, new_col, size(image, 3));
output = cast(output, class(image));

for idx = 1:size(image, 3)
    channel = double(image(:,:,idx));
    temp = channel(in1_ind).*(1 - delta_r).*(1 - delta_c) + channel(in2_ind).*(delta_r).*(1 - delta_c) + channel(in3_ind).*(1 - delta_r).*(delta_c) + channel(in4_ind).*(delta_r).*(delta_c);
    output(:,:,idx) = cast(temp, class(image));
end

end