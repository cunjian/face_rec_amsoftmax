% evaluate face recognition performance before and after synthesis


%% caffe setttings
matCaffe = '/Caffe-AM-Softmax/';

addpath(genpath(matCaffe));
gpu = 1;
if gpu
   gpu_id = 0;
   caffe.set_mode_gpu();
   caffe.set_device(gpu_id);
else
   caffe.set_mode_cpu();
end
caffe.reset_all();

model   = 'AMSoftmax/prototxt/face_deploy.prototxt';
weights = 'AMSoftmax/models/face_train_iter_30000.caffemodel';

net     = caffe.Net(model, weights, 'test');
%net.save('result/sphereface_model.caffemodel');

%% compute features
thm_dir='Samples/Aaron_Eckhart/';
thm_files=dir(thm_dir);

vis_dir='Samples/Aaron_Peirsol/';
vis_files=dir(vis_dir);

scores=[];
labels=[];

for i=3:length(thm_files)
    thm_sample=thm_files(i).name;
    thm_feature=extractDeepFeature(strcat(thm_dir,thm_sample),net);
    
    for j=3:length(vis_files)
        vis_sample=vis_files(j).name;
        vis_feature=extractDeepFeature(strcat(vis_dir,vis_sample),net);
        % compute the similarity
        %sim_score=pdist([thm_feature';vis_feature'],'cosine'); % distance
        sim_score=dot(thm_feature',vis_feature')/(norm(thm_feature)*norm(vis_feature));
        scores=[scores sim_score];
        
    end
    i
end

% % compute ROC
% [X,Y] = perfcurve(labels,scores,1);
% figure;
% plot(X,Y,'g');
% %semilogx(X,Y,'g');
% grid on
