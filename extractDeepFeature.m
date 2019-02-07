    
function feature = extractDeepFeature(file, net)
    img     = single(imread(file));
    if length(size(img))==2
        rgbImage = cat(3,img, img, img);
        img=rgbImage;
    end
    img=imresize(img,[112,96]);
    
    img     = (img - 127.5)/128;
    img     = permute(img, [2,1,3]);
    img     = img(:,:,[3,2,1]);
    res     = net.forward({img});
    res_    = net.forward({flip(img, 1)});
    feature = double([res{1}; res_{1}]);
end