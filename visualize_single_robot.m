function visualize_single_robot(handle, text1, t)
   M(t) = getframe;
   for i = 1:numel(handle)
       delete(handle(i));
       delete(text1(i));
   end
end